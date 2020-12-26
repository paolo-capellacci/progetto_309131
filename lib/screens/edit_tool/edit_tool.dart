

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_309131/models/tool.dart';

import 'package:progetto_309131/providers/service_tool.dart';
import 'package:provider/provider.dart';

class EditTool extends StatefulWidget {
  final Tool tool;

  const EditTool({Key key, this.tool}) : super(key: key);

  @override
  _EditToolState createState() => _EditToolState();
}

class _EditToolState extends State<EditTool> {
  TextEditingController _nameTC;
  TextEditingController _diameterTC;
  TextEditingController _sharpTC;
  TextEditingController _lengthTC;
  TextEditingController _materiaTC;
  TextEditingController _teethTC;

  @override
  void initState() {
    super.initState();
    _nameTC = TextEditingController(text: widget.tool.name);
    _diameterTC = TextEditingController(text: widget.tool.diameter.toString());
    _sharpTC = TextEditingController(text: widget.tool.sharp.toString());
    _lengthTC = TextEditingController(text: widget.tool.length.toString());
    _materiaTC = TextEditingController(text: widget.tool.material.toString());
    _teethTC = TextEditingController(text: widget.tool.teeth.toString());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Tools'),
      ),
      body: Container(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Name: ",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black38, fontSize: 22),
                        controller: _nameTC,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          child: Image.asset(
                            'assets/images/${Tool.materialTools[widget.tool.material]}.png',
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 60,
                              child: TextFormField(
                                controller: _lengthTC,
                              ),
                            ),
                            Container(
                              width: 60,
                              child: TextFormField(
                                controller: _sharpTC,
                              ),
                            ),
                            Container(
                              width: 60,
                              child: TextFormField(
                                controller: _diameterTC,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 60,
                              child: TextFormField(
                                controller: _materiaTC,
                              ),
                            ),
                            Container(
                              width: 60,
                              child: TextFormField(
                                controller: _teethTC,
                                cursorHeight: 40,
                              ),
                            ),
                            SelectMaterial(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

                // TextField(
                //   controller: nameTC,),
                SelectTeeth(),

                ElevatedButton(
                  child: Text('Salva'),
                  onPressed: () {
                    print('id: ${widget.tool.id} ');

                    Provider.of<ServiceTool>(context, listen: false).update(
                        widget.tool.id,
                        _nameTC.value.text,
                        double.parse(_diameterTC.value.text),
                        double.parse(_sharpTC.value.text),
                        double.parse(_lengthTC.value.text),
                        int.parse(_materiaTC.value.text),
                        int.parse(_teethTC.value.text),
                        1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SelectMaterial extends StatefulWidget {

  final Tool tool;

  const SelectMaterial({Key key, this.tool}) : super(key: key);

  @override
  _SelectMaterialState createState() => _SelectMaterialState();
}

class _SelectMaterialState extends State<SelectMaterial> {

  int selectMaterial = 0;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        items: <int>[0, 1, 2, 3, 4, 5]
            .map((e) => DropdownMenuItem<int>(
            value: e, child: Text(Tool.materialTools[e])))
            .toList(),
        value: selectMaterial,
        onChanged: (item) {
          print("selezionato ${item}");
          setState(() {
            selectMaterial = item;
          });
        });
  }
}

class SelectTeeth extends StatefulWidget {

  final Tool tool;

  const SelectTeeth({Key key, this.tool}) : super(key: key);

  @override
  _SelectTeethState createState() => _SelectTeethState();
}

class _SelectTeethState extends State<SelectTeeth> {

  int selectTeeth = 3;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        items: <int>[1, 2, 3, 4, 6, 8, 12]
            .map((e) => DropdownMenuItem<int>(
            value: e, child: Text(e.toString())))
            .toList(),
        value: selectTeeth,
        onChanged: (item) {
          print("selezionato ${item}");
          setState(() {
            selectTeeth = item;
          });
        });
  }
}

