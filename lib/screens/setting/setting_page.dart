import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:progetto_309131/providers/work.dart';
import 'package:progetto_309131/screens/widget/logo.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Logo(),
            Text('Setting Page'),
            SliderGrid(),
            /*
            Consumer<Work>(
                builder: (context, work, child) {
                  return Text("the value of the consumer is: ${work.workX}");
                },
            ),
            */
          ],
        ),
      ),
    );
  }
}

class SliderGrid extends StatefulWidget {
  @override
  _GridState createState() => new _GridState();
}

class _GridState extends State<SliderGrid> {

  //final SingletonWork work = SingletonWork.instance;

  double posx = 0.0; // work.workX;
  double posz = 0.0; // work.workZ;

/*
  @override
  void initState()  {
    super.initState();

    update();

  }
*/

  void update() async {

    posx = context.watch<Work>().getX();
    posz = context.watch<Work>().getZ();
  }


  @override
  build(BuildContext context) {
    return Container(
      //alignment: Alignment.centerLeft,
      //width: 300,
      height: 300,
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 160,
            child: LayoutBuilder(builder: (context,constraints){
              final maxWidth = constraints.maxWidth - 40;
              return SizedBox(
                height: 60,
                child: Stack(
                  fit:StackFit.expand,
                  children: [
                    Positioned(
                      top:maxWidth * posz * 0.007,
                      left: maxWidth * posx * 0.01,
                      child: Center(
                        child: Container(
                          color: Colors.blue,
                          width: 40,
                          height: 40,
                          //alignment: Alignment(200.0, 400.0),
                          //padding: EdgeInsets.only(top: 100),
                        ),
                      ),)
                  ],
                ),
              );
            }),
          ),

          Slider(
            value: posx,
            min: 0.0,
            max: 100.0,
            divisions: 20,
            label: posx.round().toString(),
            onChanged: (double value) {
              //print('slicer ${value}');
              setState(
                () {
                  posx = value;
                  updateX(value);
                },
              );
            },
          ),
          Slider(
            value: posz,
            min: 0.0,
            max: 100.0,
            divisions: 20,
            label: posz.round().toString(),
            onChanged: (double value) {
              //print('slicer ${value}');
              setState(
                    () {
                  posz = value;
                  updateZ(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void updateX(double x) async {
    context.read<Work>().updateX(x);
  }
  void updateZ(double z) async {
    context.read<Work>().updateZ(z);
  }

}
