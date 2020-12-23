
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:progetto_309131/screens/widget/logo.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  String appName = " ";
  String packageName = " ";
  String version = " ";
  String buildNumber = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),


        child: Column(
          children: [
            SizedBox(height: 10,),
            Logo(),

            SizedBox(
              height: 20,
            ),
            Text('Info',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),

            SizedBox(height: 20,),

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

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText2(appName),
                    //getText2(packageName),
                    getText2(version),
                    getText2(buildNumber),
                  ],
                ),
              ],
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }

  Text getText1(String s) {

    return Text('${s}',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 22.0,
      ),
    );
  }

  Text getText2(String s) {

    return Text('${s}',
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

    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

}
