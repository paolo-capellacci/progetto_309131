import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:package_info/package_info.dart';
import 'package:progetto_309131/providers/engine.dart';
import 'package:progetto_309131/screens/widget/logo.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 151, 185, 1.0),
        title: Text('Info'),
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(4),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                child: Logo(),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: InfoApp(),
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Center(
                    child: Image.asset(
                      "assets/images/first_imag.png",
                      //fit: BoxFit.fitWidth,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ========== class InfoApp =============== */
class InfoApp extends StatefulWidget {
  @override
  _InfoAppState createState() => _InfoAppState();
}

class _InfoAppState extends State<InfoApp> {
  String appName = " ";
  String packageName = " ";
  String version = " ";
  String buildNumber = " ";
  String engine = " ";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Text('Version: '),
                  Text('Package: '),
                  Text('Version: '),
                  Text('Build: '),
                  Text('Engine: '),
                ],
              ),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {

                  String package = '-';
                  String version = '-';
                  String builder = '-';

                  if (snapshot.hasData) {
                    package = snapshot.data.packageName;
                    version = snapshot.data.version;
                    builder = snapshot.data.buildNumber;
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        '$package',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$version',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Text(
                          '$builder',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      EngineVersion(),

                    ],
                  );
                },
              ),
            ],
          ),
        ],
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

class EngineVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String engine = " ";
    return Consumer<GetEngineVersion>(
      builder: (context, value, _) {
        return Text(
          '${value.version}',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
