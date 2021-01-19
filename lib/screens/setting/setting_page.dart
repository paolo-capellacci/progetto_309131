import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:progetto_309131/models/materials_enum.dart';
import 'package:progetto_309131/models/tools_enum.dart';
import 'package:progetto_309131/providers/service_tool.dart';
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
            //SliderGrid(),
            CenterSetting(),
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
              height: 200,
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
                          'assets/images/${FresaEnum.FresaHmR.image}', //${_selectMaterialWork.image}',
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                      ),

                      Positioned(
                        top: 200 - work.getZ() * 1,
                        left: centerWidth - 220 + work.getX()*0.4,
                        //top: maxWidth * work.getX() * 0.01,
                        //left: maxWidth * work.getZ() * 0.01,
                        child: Center(
                          child: Container(
                            color: Color.fromRGBO(0, 0, 255, 0.5),
                            width: 200,
                            height: 200,
                            //alignment: Alignment(200.0, 400.0),
                            //padding: EdgeInsets.only(top: 100),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Slider(
              value: work.getX(),
              min: 5.0,
              max: 100.0,
              divisions: 19,
              label: (work.getX().round()).toString() + ' %',
              onChanged: (double value) {
                setState(() {
                  work.setX(value);
                });
              },
            ),
            Slider(
              value: work.getZ(),
              min: 5.0,
              max: 100.0,
              divisions: 19,
              label: ((work.getZ()).round()).toString() + ' %',
              onChanged: (double value) {
                setState(() {
                  work.setZ(value);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
