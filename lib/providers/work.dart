

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Work extends ChangeNotifier {

  int materialWork = 40;
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


    materialWork = prefs.getInt('materialWork');
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