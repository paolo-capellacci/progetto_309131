
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:progetto_309131/providers/service_tool.dart';

import 'screens/home/home.dart';
void main() {
  runApp(MyApp());
}
// /Users/paolo/Library/Developer/CoreSimulator/Devices/80190513-8E62-4C4E-BA86-B87A218D2398/data/Containers/Data/Application/59155C5C-8D61-43FC-ADC1-706881596099/Documents

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context){
        //ServiceTool()..getAllTools()
        final service = ServiceTool();
        service.getAllTools();
        return service;
      },
      child: App(),
    );
  }
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(), // HomePage(),
        '/listTools': (context) => Home(),
        '/editTool': (context) => Home(),
        '/info': (context) => Home(),
        '/setting': (context) => Home(),
      },
    );
  }
}