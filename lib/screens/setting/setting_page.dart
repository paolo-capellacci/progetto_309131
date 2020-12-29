import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progetto_309131/screens/widget/logo.dart';

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
  double posx = 0.0, posz = 0.0;
  double _val1 = 20;
  var _val2 = 20;
  double _currentSlider = 10.0;

  @override
  build(BuildContext context) {
    return Container(
      //alignment: Alignment.centerLeft,
      width: 300,
      height: 400,
      padding: EdgeInsets.only(top: 200),
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          /*
          Container(
            transform: Matrix4.rotationZ(270 * 3.14 / 180),
            child: Slider(
              value: _currentSlider,
              min: 0.0,
              max: 100.0,
              divisions: 20,
              label: _currentSlider.round().toString(),
              onChanged: (double value) {
                print('slicer ${value}');
                setState(
                  () {
                    _currentSlider = value;
                  },
                );
              },
            ),
          ),
          */
          Slider(
            value: posx,
            min: 0.0,
            max: 1.0,
            divisions: 20,
            label: posx.round().toString(),
            onChanged: (double value) {
              print('slicer ${value}');
              setState(
                () {
                  posx = value;
                },
              );
            },
          ),
          /*
          new Container(
            child: new Transform(
              alignment: FractionalOffset.centerLeft,
              // Rotate sliders by 90 degrees
              transform: new Matrix4.identity()..rotateZ(270 * 3.1415927 / 180),
              child: new Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Slider(
                    value: _val2.toDouble(),
                    min: 1.0,
                    max: 100.0,
                    divisions: 20,
                    label: '$_val2',
                    onChanged: (double newValue) {
                      setState(() {
                        _val2 = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          */

          LayoutBuilder(builder: (context,constraints){
            final maxWidth = constraints.maxWidth - 40;
            return SizedBox(
              height: 60,
              child: Stack(
                fit:StackFit.expand,
                children: [
                  Positioned(
                    top:0,
                    left: maxWidth * posx,
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


        ],
      ),
    );
  }
}
