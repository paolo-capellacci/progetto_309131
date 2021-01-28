

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Status extends ChangeNotifier {





  void setId(int id) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', id);

    notifyListeners();
  }


  Future<int> getId() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt('id');
  }


}