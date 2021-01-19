

import 'package:flutter/material.dart';
import 'package:progetto_309131/models/materials_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Work extends ChangeNotifier {

  MaterialEnum _materialWork = MaterialEnum.Iron;
  double _workX = 10.0;
  double _workZ = 10.0;

  void initWork()  {

  }

  void loadAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('materialWork') == null)
      prefs.setInt('materialWork', 40);

    if (prefs.getDouble('workX') == null)
      prefs.setDouble('workX', 10.0);

    if (prefs.getDouble('workZ') == null)
      prefs.setDouble('workZ', 10.0);


    //materialWork = prefs.getInt('materialWork');
    _workX = prefs.getDouble('workX');
    _workZ = prefs.getDouble('workZ');

    notifyListeners();
  }


  void setX(double x) async {

    _workX = x;

    notifyListeners();
  }
  void setZ(double z) async {

    _workZ = z;

    notifyListeners();
  }

  double getX() {
    return _workX;
  }

  double getZ() {
    return _workZ;
  }
  void setMaterial(MaterialEnum m) async {

    _materialWork = m;

    notifyListeners();
  }

  MaterialEnum getMaterial() {
    return _materialWork;
  }

}

class ListWork extends ChangeNotifier {

  List<Work> _work = [];

  Future<List<Work>> getWork() async {

    _work.add(Work());

    notifyListeners();
  }
  void setX(double x) async {

    _work[0]._workX = x;

    notifyListeners();
  }

  void setZ(double z) async {

    _work[0]._workZ = z;

    notifyListeners();
  }

  void setMaterial(MaterialEnum m) async {

    _work[0]._materialWork = m;

    notifyListeners();
  }

  double getX() {
    return _work[0]._workX;
  }

  double getZ() {
    return _work[0]._workZ;
  }

  MaterialEnum getMaterial() {
    return _work[0]._materialWork;
  }

}