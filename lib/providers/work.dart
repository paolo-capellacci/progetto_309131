import 'package:flutter/material.dart';
import 'package:progetto_309131/models/materials_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Work extends ChangeNotifier {
  MaterialEnum _materialWork = MaterialEnum.Iron;
  double _workX = 10.0;
  double _workZ = 10.0;

  void initWork() {}

  void setWork() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getDouble('x') == null) {
      prefs.setDouble('x', 10);
    }
    if(prefs.getDouble('z') == null) {
      prefs.setDouble('z', 10);
    }

    this._workX = prefs.getDouble('x');
    this._workZ = prefs.getDouble('z');

    notifyListeners();
  }

  void setX0() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble('x', _workX);
    print('status x: ${_workX}');

    notifyListeners();
  }

  void setZ0() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble('z', _workZ);
    print('status z: ${_workZ}');

    notifyListeners();
  }

  double getX() {
    return _workX;
  }

  double getZ() {
    return _workZ;
  }

  MaterialEnum getMaterial() {
    return _materialWork;
  }

  void setX(double x) {
    _workX = x;

    notifyListeners();
  }

  void setZ(double z) {
    _workZ = z;

    notifyListeners();
  }

  void setMaterial(MaterialEnum m) {
    _materialWork = m;

    notifyListeners();
  }
}
