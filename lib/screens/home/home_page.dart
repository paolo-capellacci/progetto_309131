//import 'dart:html';

//import 'dart:js';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:progetto_309131/models/materials_enum.dart';
import 'package:progetto_309131/models/work3.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:progetto_309131/models/tool.dart';
import 'package:progetto_309131/models/tools_enum.dart';
import 'package:progetto_309131/providers/service_tool.dart';
import 'package:progetto_309131/screens/widget/logo.dart';
import 'package:progetto_309131/providers/work.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalcolaNotifier(),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Selector<ServiceTool, Tool>(shouldRebuild: (pre, next) {
                return pre != next;
              }, selector: (context, notifier) {
                return notifier.selectedTool;
              }, builder: (BuildContext context, tool, child) {
                if (tool == null) {
                  return CircularProgressIndicator();
                }
                return Column(
                  children: [
                    Logo(),

                    TopHome(tool: tool),
                    CenterHome(tool: tool),
                    //BottomHome(tool: tool),
                    BottomHome(),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHome extends StatelessWidget {
  final Tool tool;

  const TopHome({this.tool});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.30,
          margin: EdgeInsets.only(left: 24, right: 24),
          child: SizedBox(
            width: 60,
            child: Image.asset(
              'assets/images/${tool.material.image}',
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('id: '),
                      Text('Name: '),
                      Text('Diameter: '),
                      Text('Sharp: '),
                      Text('Length: '),
                      Text('Material: '),
                      Text('Teeth: '),
                      //Text('cool: '),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tool.id.toString()),
                      Text(tool.name),
                      Text(tool.diameter.toString()),
                      Text(tool.sharp.toString()),
                      Text(tool.length.toString()),
                      Text(tool.material.text),
                      Text(tool.teeth.toString()),
                      //Text(tool.cool.toString()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            ElevatedButton(
              child: Text('Select Tools'),
              onPressed: () async {
                print('vai alla lista tools');
                Navigator.of(context).pushNamed('/listTools');
                //Navigator.of(context).pushNamedAndRemoveUntil('/listTools', (route) => route.settings.name == '/');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CalcolaNotifier extends ChangeNotifier {
  String speed1 = '-';
  String speed2 = '-';
  String speed3 = '-';

  //final SingletonWork work = SingletonWork.instance;

  bool loading = false;

  calcola(Tool tool, ListWork work) async {
    loading = true;
    notifyListeners();
    // http://paoloweb.altervista.org/00/request.php?diameter=12.34&teeth=43.21%27
    var url = 'http://paoloweb.altervista.org/00/request.php';
    final response = await http.post(url, body: {
      'diameter': '${tool.diameter}',
      'sharp': '${tool.sharp}',
      'length': '${tool.length}',
      'material': '${tool.material.value}',
      'teeth': '${tool.teeth}',
      'cool': '${tool.cool}',
      'materialWork': '${work.getMaterial().value}',
      'workPercent': '${work.getX()}',
      'workHeight': '${work.getZ()}',
    });
    //print('material: ${tool.material.value}');
    print('materialWork: ${work.getMaterial().value }');
    print('workX: ${work.getX()}');
    print('workZ: ${work.getZ()}');

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final result = response.body.split(',');
    //print(result[0]);

    speed1 = result[0];
    speed2 = result[1];
    speed3 = result[2];
    loading = false;

    notifyListeners();
  }
}

class CenterHome extends StatelessWidget {
  final Tool tool;

  const CenterHome({Key key, this.tool}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<CalcolaNotifier>(
      builder: (BuildContext context, value, Widget child) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('Spindle Speed: '),
                  Text('Work Speed xy: '),
                  Text('Work Speed z: '),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${value.speed1} g/m: '),
                  Text('${value.speed2} m/s:'),
                  Text('${value.speed3} m/s:'),
                ],
              ),
              Spacer(),
              if (value.loading)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                ElevatedButton(
                  child: Text('Calcola'),
                  onPressed: () async {
                    final work = context.read<ListWork>();
                    print('wqrerewrerew ${work.getX()}');
                    context.read<CalcolaNotifier>().calcola(tool, work);
                  },
                ),

              //WhidgetSwitch(),//widget.tool.cool),
            ],
          ),
        );
      },
    );
  }
}


class BottomHome extends StatefulWidget {
  @override
  _BottomHomeState createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ListWork>(
      builder: (context, work, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.20,
          margin: EdgeInsets.all(4),
          //padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              LimitedBox(
                //maxHeight: 100,
                child: Image.asset(
                  'assets/images/materialWork/${work.getMaterial().image}', //${_selectMaterialWork.image}',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  //height: MediaQuery.of(context).size.height * 0.18,
                ),
              ),

              /* menu for select the type of the material Work */
              DropdownButton<MaterialEnum>(
                  items: MaterialEnum.values
                      .map((e) => DropdownMenuItem<MaterialEnum>(
                          value: e, child: Text(e.text)))
                      .toList(),
                  value: work.getMaterial(),
                  onChanged: (item) {
                    print("selezionato ${item}");
                    setState(() {
                      work.setMaterial(item);// = item;
                    });
                  }),

            ],
          ),
        );
      },
    );
  }

  void updateMaterial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //this._selectMaterialWork = prefs.getInt('materialWork');
  }
}

class SelectMaterialNotifier extends ChangeNotifier {
  SelectMaterialNotifier(MaterialEnum selectedMaterial) {
    materialWork = selectedMaterial;
  }

  MaterialEnum materialWork;

  changeMaterial(MaterialEnum material) {
    this.materialWork = material;
    notifyListeners();
  }
}
