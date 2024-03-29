//import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter/services.dart';
import 'package:progetto_309131/providers/engine.dart';
import 'package:progetto_309131/providers/status.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'providers/work.dart';
import 'navigation_page.dart';
import 'providers/service_tool.dart';
import 'screens/edit_tool/edit_tool.dart';
import 'screens/info/info_page.dart';
import 'screens/list_tools/list_page.dart';
import 'screens/setting/setting_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((val) {
    runApp(MyApp());
  });
}

/*
void main() {

  runApp(MyApp());
}
*/

// directory per db nel simulatore iSO
// /Users/paolo/Library/Developer/CoreSimulator/Devices/80190513-8E62-4C4E-BA86-B87A218D2398/data/Containers/Data/Application/59155C5C-8D61-43FC-ADC1-706881596099/Documents

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            //ServiceTool()..getAllTools()
            final service = ServiceTool();
            service.getAllTools();

            return service;
          },
        ),
        ChangeNotifierProvider(create: (context) => GetEngineVersion()..getVersion(),),
        ChangeNotifierProvider(create: (context) => Status(),),
        ChangeNotifierProvider(create: (context) => Work()..setWork()),
      ],
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
        '/info': (context) => InfoApp(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}
