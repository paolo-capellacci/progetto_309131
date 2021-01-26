

import 'package:flutter/material.dart';

class Status extends ChangeNotifier {

  int selectId = 0;

  void setId(int id) {
    selectId = id;

    notifyListeners();
  }
  int getId() {

    return selectId;
  }


}