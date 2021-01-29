
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:progetto_309131/providers/service_tool.dart';
import 'package:progetto_309131/providers/work.dart';

import 'package:progetto_309131/models/materials_enum.dart';
import 'package:progetto_309131/models/tools_enum.dart';
import 'package:progetto_309131/models/tool.dart';

import 'package:progetto_309131/screens/widget/logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 151, 185, 1.0),
        title: Text('Home'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CalcolaNotifier(),
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(8),
            child: Selector<ServiceTool, Tool>(shouldRebuild: (pre, next) {
              return pre != next;
            }, selector: (context, notifier) {
              return notifier.selectedTool;
            }, builder: (BuildContext context, tool, child) {
              if (tool == null) {
                return CircularProgressIndicator();
              }
              return Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(4),
                      child: Logo(),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      //color: Colors.lightGreenAccent,
                      child: Card(
                        child: TopHome(tool: tool),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Container(
                      //color: Colors.yellow,
                      child: Card(
                        child: CenterHome(tool: tool),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(
                      //color: Colors.greenAccent,
                      child: Card(
                        child: BottomHome(),
                      ),
                    ),
                  ),
                ],
              );
            }),
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
    return Consumer<CalcolaNotifier>(
        builder: (BuildContext context, value, Widget child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.35,
              child: Stack(
                //alignment: Alignment.center,
                //fit: StackFit.loose,

                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: tool.cool == true
                          ? new Container(
                              child: Image.asset(
                                'assets/images/coll.png',
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                              ),
                            )
                          : new Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Image.asset(
                        'assets/images/${tool.material.image}',
                        fit: BoxFit.fitHeight,
                        //alignment: Alignment.centerLeft,
                        height: MediaQuery.of(context).size.height * 0.27,
                      ),
                    ),
                  ),
                ],
                //overflow: Overflow.clip,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //Text('id: '),
                        Text('Name: '),
                        Text('Diameter: '),
                        Text('Sharp: '),
                        Text('Length: '),
                        Text('Material: '),
                        Text('Teeth: '),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text(tool.id.toString()),
                        Text(tool.name),
                        Text(tool.diameter.toString()),
                        Text(tool.sharp.toString()),
                        Text(tool.length.toString()),
                        Text(tool.material.text),
                        Text(tool.teeth.toString()),
                      ],
                    )
                  ],
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
            )
          ],
        ),
      );
    });
  }
}

class CenterHome extends StatelessWidget {
  final Tool tool;

  const CenterHome({this.tool});

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('Spindle Speed: '),
                  Text('Work Speed xy: '),
                  Text('Work Speed z: '),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${value.speed1} g/m: '),
                  Text('${value.speed2} mm/s:'),
                  Text('${value.speed3} mm/s:'),
                ],
              ),
              Spacer(),
              if (value.loading)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                Column(
                  children: [
                    Text('Diameter: ${context.watch<Work>().getX()} %'),
                    Text('         Flut: ${context.watch<Work>().getZ()} %'),
                    ElevatedButton(
                      child: Text('Calcola'),
                      onPressed: () async {
                        final work = context.read<Work>();
                        //print('wqrerewrerew ${work.getX()}');
                        context.read<CalcolaNotifier>().calcola(tool, work);
                      },
                    ),
                  ],
                ),
              Spacer(),

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
    return Consumer<Work>(
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
                    work.setMaterial(item); // = item;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CalcolaNotifier extends ChangeNotifier {
  String speed1 = '-';
  String speed2 = '-';
  String speed3 = '-';

  //final SingletonWork work = SingletonWork.instance;

  bool loading = false;

  calcola(Tool tool, Work work) async {
    loading = true;
    //notifyListeners();
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
    // print('cool:  ${tool.cool}');
    // print('materialWork: ${work.getMaterial().value}');
    // print('workX: ${work.getX()}');
    // print('workZ: ${work.getZ()}');
    //
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    final result = response.body.split(',');
    //print(result[0]);

    speed1 = result[0];
    speed2 = result[1];
    speed3 = result[2];
    loading = false;

    notifyListeners();
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
