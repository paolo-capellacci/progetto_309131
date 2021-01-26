import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progetto_309131/prova.dart';
import 'package:progetto_309131/prova2.dart';
import 'package:progetto_309131/screens/home/home_page.dart';
import 'package:progetto_309131/screens/info/info_page.dart';
import 'package:progetto_309131/screens/setting/setting_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationPageState();
  }
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    InfoPage(),
    //Prova2(),
    SettingPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 151, 185, 1.0),
        title: Text('Home'),
      ),
      */
      body: _children[_currentIndex],
      // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,

        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',// Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',// Text('Info'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting', //Text('Settings'),
          ),
        ],

      ),
    );
  }
}
/*
class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

*/
