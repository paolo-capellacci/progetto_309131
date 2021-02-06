import 'package:flutter/material.dart';
import 'package:progetto_309131/models/materials_enum.dart';

class Work extends ChangeNotifier {
  MaterialEnum _materialWork = MaterialEnum.Iron;
  double _workX = 10.0;
  double _workZ = 10.0;

  void initWork() {}

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
