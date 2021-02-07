import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:package_info/package_info.dart';
import 'package:progetto_309131/providers/engine.dart';
import 'package:progetto_309131/screens/widget/logo.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 151, 185, 1.0),
        title: Text('Info'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(4),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(4),
                  child: Logo(),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: InfoApp(),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: Center(
                    child: Image.asset(
                      "assets/images/first_imag.png",
                      //fit: BoxFit.fitWidth,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Map to App',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(''),
                        Image.asset(
                          "assets/images/redame/app_speed_tools2.png",
                          //fit: BoxFit.fitWidth,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /* === Page home === */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(''),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "In the Home page it is possible to see in the top the select tool, in the bottom the selected material to work with, and in the center the value of the speed tool",
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Image.asset(
                          "assets/images/redame/home.png",
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width * 0.32,
                          //alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),

              /* === List Page === */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'List Tools',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(''),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "In the list page it is possible to see the tools library and it is possible to select a tool, or delete one, or go in the edit page to change the type of tool.  ",
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Image.asset(
                          "assets/images/redame/listPage.png",
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width * 0.32,
                          //alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),

              /* === Page edit === */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(''),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "In the Edit page it is possible to see the tool name, the tool image, and its attributes. It is also possible to active the cooling system, the number of the tool's teeth, and the tool's type of material. In the bottom there is a button that permits to save.",
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Image.asset(
                          "assets/images/redame/edit.png",
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width * 0.32,
                          //alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              /* === Page select === */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
                        children: [
                          Text(
                            'Setting Work',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(''),
                          Container(
                            width: 150,
                            child: Text(
                              "In the Setting Work page it is possible to define the depth and the percentage XY of the material one is going to remove.",
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Image.asset(
                          "assets/images/redame/setting.png",
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width * 0.32,
                          //alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
