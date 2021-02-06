

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Status extends ChangeNotifier {

  bool _iscalculate = false;

/*
  void setId(int id) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', id);
    print('status is: ${id}');

    notifyListeners();
  }


  Future<int> getId() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt('id');
  }
  */

  void setCalculate(bool b) {
    //print('calculate false');
    _iscalculate = b;

    notifyListeners();
  }

  bool getCalculate() {
    return _iscalculate;
  }

}