import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:progetto_309131/screens/widget/logo.dart';
import 'package:progetto_309131/screens/widget/mark.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [

          Card(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Logo(),
            ),
          ),

          /*
          Card(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Mark(),
            ),
          ),
*/


          Card(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: InfoApp3(),
            ),
          ),

        ],
      ),
    );
  }
}

class InfoApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text('AppName:'),
                  Text('Version: '),
                  Text('Build: '),

                ],
              )
            ],
          )

        ],
      ),
    );
  }
}




class InfoApp extends StatefulWidget {
  @override
  _InfoAppState createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text('AppName:'),
                    Text('Version: '),
                    Text('Build: '),

                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}





class InfoApp2 extends StatefulWidget {
  @override
  _InfoApp2State createState() => _InfoApp2State();
}

class _InfoApp2State extends State<InfoApp2> {
  String appName = " ";
  String packageName = " ";
  String version = " ";
  String buildNumber = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(20),

        child: Column(
          children: [
            Text(
              'Info',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    getText1('App Name: '),
                    //getText1('Package: '),
                    getText1('Version: '),
                    getText1('Builder: '),
                  ],
                ),
                FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      String appName = '-';
                      String version = '-';
                      String builder = '-';

                      if (snapshot.hasData) {
                        appName = snapshot.data.appName;
                        version = snapshot.data.version;
                        builder = snapshot.data.buildNumber;
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('AppName: $appName'),
                          Text('version: $version'),
                          Text('builder: $builder'),
                          //getText2(packageName),
                          // getText2(version),
                          // getText2(buildNumber),
                        ],
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text getText1(String s) {
    return Text(
      '${s}',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 22.0,
      ),
    );
  }

  Text getText2(String s) {
    return Text(
      '${s}',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    initStateAsync();
  }

  Future initStateAsync() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    print('init');
    appName = await packageInfo.appName;
    packageName = await packageInfo.packageName;
    version = await packageInfo.version;
    buildNumber = await packageInfo.buildNumber;

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
