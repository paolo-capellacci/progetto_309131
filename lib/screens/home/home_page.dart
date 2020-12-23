import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:progetto_309131/models/tool.dart';
import 'package:progetto_309131/providers/service_tool.dart';
import 'package:progetto_309131/screens/widget/logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  //BottomHome(),
                  WidgetSlider(),

                ],
              );
            }),
          ],
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
              'assets/images/${Tool.materialTools[tool.material]}.png',
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
                      Text(Tool.materialTools[tool.material]),
                      Text(tool.teeth.toString()),
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

class CenterHome extends StatefulWidget {
  final Tool tool;

  const CenterHome({Key key, this.tool}) : super(key: key);

  @override
  _CenterHomeState createState() => _CenterHomeState();
}

class _CenterHomeState extends State<CenterHome> {
  @override
  Widget build(BuildContext context) {
    var speed1 = '0';
    var speed2 = '0';
    var speed3 = '0';

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
              Text('${speed1} g/m: '),
              Text('$speed2 m/s:'),
              Text('$speed3 m/s:'),
            ],
          ),
          Spacer(),
          ElevatedButton(
            child: Text('Calcola'),
            onPressed: () async {
              // http://paoloweb.altervista.org/00/request.php?diameter=12.34&teeth=43.21%27
              var url = 'http://paoloweb.altervista.org/00/request.php';
              final response = await http.post(url, body: {
                'diameter': '${widget.tool.diameter}',
                'sharp': '${widget.tool.sharp}',
                'length': '${widget.tool.length}',
                'material': '${widget.tool.material}',
                'teeth': '${widget.tool.teeth}',
                'materialWork': '${widget.tool.materialWork}',
                'workHeight': '${widget.tool.workHeight}',
                'workPercent': '${widget.tool.workPercent}'
              });

              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              final result = response.body.split(',');
              print(result[0]);
              speed1 = result[0];
              speed2 = result[1];
              speed3 = result[2];

              setState(() {
                speed1 = '12';
                speed2 = '13';
                speed3 = '21';
              });
            },
          ),

          WhidgetSwitch(),//widget.tool.cool),
        ],
      ),
    );
  }
}

class BottomHome extends StatefulWidget {
  @override
  _BottomHomeState createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {

  int _seletedMaterial = 10;

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
              "assets/images/material$_seletedMaterial.png",
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),

          DropdownButton(
              value: _seletedMaterial,
              items: [
                DropdownMenuItem(
                  child: Text("Wood"),
                  value: 80,
                ),
                DropdownMenuItem(
                  child: Text("Plastic"),
                  value: 60,
                ),
                DropdownMenuItem(
                    child: Text("Aluminium"),
                    value: 40
                ),
                DropdownMenuItem(
                    child: Text("Iron"),
                    value: 10
                ),
                DropdownMenuItem(
                    child: Text("Steel"),
                    value: 5
                ),
                DropdownMenuItem(
                    child: Text("Temperate Steel"),
                    value: 2
                ),
              ],
              onChanged: (value) {
                print('select: ${value}');
                setState(() {
                  _seletedMaterial = value;
                });
              })
        ],
      ),
    );
  }
}

class WhidgetSwitch extends StatefulWidget {

  final Tool tool;

  const WhidgetSwitch({Key key, this.tool}) : super(key: key);

  @override
  _WhidgetSwitchState createState() => _WhidgetSwitchState();
}

class _WhidgetSwitchState extends State<WhidgetSwitch> {

  bool isSwitched = true;//widget.tool.cool;// tool.cool == 1 ? true: false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },
      ),
    );
  }
}

class WidgetSlider extends StatefulWidget {
  @override
  _WidgetSliderState createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<WidgetSlider> {

  double _currentSlider = 10.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _currentSlider,
        min: 0.0,
        max: 100.0,
        divisions: 20,
        label: _currentSlider.round().toString(),
        onChanged: (double value) {
          print('slicer ${value}');
          setState(() {
            _currentSlider = value;
          });
        });
  }
}


