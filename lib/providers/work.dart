

import 'package:flutter/material.dart';
import 'package:progetto_309131/models/materials_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Work extends ChangeNotifier {

  MaterialEnum materialWork = MaterialEnum.Iron;
  double workX = 10.0;
  double workZ = 10.0;

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
    workX = prefs.getDouble('workX');
    workZ = prefs.getDouble('workZ');

    notifyListeners();
  }


  void updateX(double x) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    workX = x;
    prefs.setDouble('workX', x);

    notifyListeners();
  }
  void updateZ(double z) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    workZ = z;
    prefs.setDouble('workZ', z);

    notifyListeners();
  }

  double getX() {
    return workX;
  }

  double getZ() {
    return workZ;
  }

}

class ListWork extends ChangeNotifier {

  List<Work> _work = [];

  Future<List<Work>> getWork() async {

    _work.add(Work());

    notifyListeners();
  }
  void setX(double x) async {

    _work[0].workX = x;

    notifyListeners();
  }

  void setZ(double z) async {

    _work[0].workZ = z;

    notifyListeners();
  }

  void setMaterial(MaterialEnum m) async {

    _work[0].materialWork = m;

    notifyListeners();
  }

  double getX() {
    return _work[0].workX;
  }

  double getZ() {
    return _work[0].workZ;
  }

  MaterialEnum getMaterial() {
    return _work[0].materialWork;
  }

}