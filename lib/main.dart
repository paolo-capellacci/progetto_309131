
import 'package:progetto_309131/navigation_page.dart';
import 'package:progetto_309131/screens/edit_tool/edit_tool.dart';
import 'package:progetto_309131/screens/info/info_page.dart';
import 'package:progetto_309131/screens/list_tools/list_page.dart';
import 'package:progetto_309131/screens/setting/setting_page.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:progetto_309131/providers/service_tool.dart';

import 'screens/home/home_page.dart';
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
        '/': (context) => NavigationPage(), // HomePage(),
        '/listTools': (context) => ListTools(),
        '/editTool': (context) => EditTool(),
        '/info': (context) => InfoPage(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}