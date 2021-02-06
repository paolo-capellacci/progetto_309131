import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:progetto_309131/providers/status.dart';
import 'package:progetto_309131/providers/work.dart';
import 'package:progetto_309131/models/tools_enum.dart';
import 'package:progetto_309131/screens/widget/logo.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 151, 185, 1.0),
        title: Text('Setting work'),
      ),
      body: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                child: Logo(),
              ),
            ),
/*
            Card(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Setting Page',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                ),
              ),
            ),
            */

            Card(
              child: Container(
                margin: const EdgeInsets.all(4),
                child: CenterSetting(),
              ),
            ),
            TextVales(),
            Card(
              child: Container(
                margin: const EdgeInsets.all(4),
                child: SliderX(),
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(4),
                child: SliderZ(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CenterSetting extends StatefulWidget {
  @override
  _CenterSettingState createState() => _CenterSettingState();
}

class _CenterSettingState extends State<CenterSetting> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Work>(
      builder: (context, work, child) {
        return Column(
          children: [
            Container(
              //color: Colors.yellow,
              height: 176,
              child: LayoutBuilder(builder: (context, constraints) {
                final centerWidth = constraints.maxWidth / 2;
                return SizedBox(
                  height: 10,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        //top: 1,
                        //left: centerWidth,
                        child: Image.asset(
                          'assets/images/${FresaEnum.HmICutter.image}', //${_selectMaterialWork.image}',
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                      ),
                      Positioned(
                        top: 176 - work.getZ() * 1,
                        left: centerWidth - 320 + work.getX() * 0.4,
                        //top: maxWidth * work.getX() * 0.01,
                        //left: maxWidth * work.getZ() * 0.01,
                        child: Center(
                          child: Container(
                            color: Color.fromRGBO(0, 0, 255, 0.5),
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

class TextVales extends StatefulWidget {
  @override
  _TextValesState createState() => _TextValesState();
}

class _TextValesState extends State<TextVales> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Work>(builder: (context, work, child) {
      return Expanded(

        child: Container(
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Percent Diameter: '),
                    Text('Percent Sharp: '),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${work.getX()} %',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text('${work.getZ()} %',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SliderX extends StatefulWidget {
  @override
  _SliderXState createState() => _SliderXState();
}

class _SliderXState extends State<SliderX> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Work>(
      builder: (context, work, child) {
        return Container(
          child: Slider(
            value: work.getX(),
            min: 5.0,
            max: 100.0,
            divisions: 19,
            label: (work.getX().round()).toString() + ' %',
            onChanged: (double value) {
              setState(() {
                work.setX(value);
              });
              context.read<Status>().setCalculate(false);
            },
          ),
        );
      },
    );
  }
}

class SliderZ extends StatefulWidget {
  @override
  _SliderZState createState() => _SliderZState();
}

class _SliderZState extends State<SliderZ> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Work>(
      builder: (context, work, child) {
        return Container(
          child: Slider(
            value: work.getZ(),
            min: 5.0,
            max: 100.0,
            divisions: 19,
            label: ((work.getZ().round()).toString() + ' %'),
            onChanged: (double value) {
              setState(() {
                work.setZ(value);
              });
              context.read<Status>().setCalculate(false);
            },
          ),
          //transform: Matrix4.rotationZ(1),
        );
      },
    );
  }
}
