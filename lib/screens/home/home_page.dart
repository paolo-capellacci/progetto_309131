//import 'dart:html';

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
import 'package:progetto_309131/models/work3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>CalcolaNotifier(),
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
                    BottomHome2(),

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
          margin: EdgeInsets.only(left: 24, right: 24),
          child: SizedBox(
            width: 60,
            child: Image.asset(
              'assets/images/${tool.material.image}',
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
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
                      Text('cool: '),
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
                      Text(tool.cool.toString()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
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

class CalcolaNotifier extends ChangeNotifier{

  String speed1 = '-';
  String speed2 = '-';
  String speed3 = '-';

  final SingletonWork work = SingletonWork.instance;

  bool loading = false;

  calcola(Tool tool)async{

    loading = true;
    notifyListeners();
    // http://paoloweb.altervista.org/00/request.php?diameter=12.34&teeth=43.21%27
    var url = 'http://paoloweb.altervista.org/00/request.php';
    final response = await http.post(url, body: {
      'diameter': '${tool.diameter}',
      'sharp': '${tool.sharp}',
      'length': '${tool.length}',
      'material': '${tool.material.value }',
      'teeth': '${tool.teeth}',
      'cool': '${tool.cool}',

      'materialWork': '${work.materialWork}.',
      'workPercent': '${work.workZ}',
      'workHeight': '${work.workX}',


    });
    //print('material: ${tool.material.value}');
    print('materialWork: ${work.materialWork}');
    print('workX: ${work.workX}');
    print('workZ: ${work.workZ}');

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final result = response.body.split(',');
    //print(result[0]);

    speed1 = '10';//result[0];
    speed2 = '10';//result[1];
    speed3 = '10';//result[2];
    loading = false;

    notifyListeners();
  }
}

class CenterHome extends StatelessWidget {
  final Tool tool;

  const CenterHome({Key key, this.tool}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Consumer<CalcolaNotifier>(builder: (BuildContext context, value, Widget child) {
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
            if(value.loading)
              Center(child: CircularProgressIndicator(),) else
            ElevatedButton(
              child: Text('Calcola'),
              onPressed: () async {
               context.read<CalcolaNotifier>().calcola(tool);

              },
            ),

            //WhidgetSwitch(),//widget.tool.cool),
          ],
        ),
      );
    },);

  }
}

class BottomHome extends StatefulWidget {

  final Tool tool;

  const BottomHome({Key key, this.tool}) : super(key: key);

  @override
  _BottomHomeState createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {

  MaterialEnum _selectMaterialWork ;
  int _seletedMaterial = 10;


  @override
  void initState() {
    super.initState();

    _selectMaterialWork = widget.tool.materialWork;

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          LimitedBox(
            maxHeight: 200,
            child: Image.asset(
              'assets/images/materialWork/${_selectMaterialWork.image}', //${_selectMaterialWork.image}',
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),


          /* menu for select the type of the material Work */
          DropdownButton<MaterialEnum>(
              items: MaterialEnum.values
                  .map((e) => DropdownMenuItem<MaterialEnum>(
                  value: e, child: Text(e.text)))
                  .toList(),
              value: _selectMaterialWork,
              onChanged: (item) {
                print("selezionato ${item}");
                setState(() {
                  _selectMaterialWork = item;
                  //Provider.of<ServiceTool>(context, listen: false).updateMaterialWork(widget.tool.id, item);
                });
              }),

        ],
      ),
    );
  }
}

class BottomHome2 extends StatefulWidget {
  @override
  _BottomHome2State createState() => _BottomHome2State();
}

class _BottomHome2State extends State<BottomHome2> {

  MaterialEnum _selectMaterialWork ;

  @override
  void initState() {
    super.initState();

    _selectMaterialWork = MaterialEnum.Steel;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          LimitedBox(
            maxHeight: 200,
            child: Image.asset(
              'assets/images/materialWork/${_selectMaterialWork.image}', //${_selectMaterialWork.image}',
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),


          /* menu for select the type of the material Work */
          DropdownButton<MaterialEnum>(
              items: MaterialEnum.values
                  .map((e) => DropdownMenuItem<MaterialEnum>(
                  value: e, child: Text(e.text)))
                  .toList(),
              value: _selectMaterialWork,
              onChanged: (item) {
                print("selezionato ${item}");
                setState(() {
                  _selectMaterialWork = item;
                });
              }),

        ],
      ),
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
