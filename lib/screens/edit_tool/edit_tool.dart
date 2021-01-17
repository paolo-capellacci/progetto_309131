import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progetto_309131/models/tools_enum.dart';
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

  FresaEnum _selectMaterialTool;
  int _selectTeeth;
  bool _cool = true;

  @override
  void initState() {
    super.initState();
    _nameTC = TextEditingController(text: widget.tool.name);
    _diameterTC = TextEditingController(text: widget.tool.diameter.toString());
    _sharpTC = TextEditingController(text: widget.tool.sharp.toString());
    _lengthTC = TextEditingController(text: widget.tool.length.toString());

    _selectMaterialTool = widget.tool.material;
    _selectTeeth = widget.tool.teeth;
    _cool = widget.tool.cool;
  }

  @override
  void dispose() {
    super.dispose();

    _nameTC.dispose();
    _diameterTC.dispose();
    _sharpTC.dispose();
    _lengthTC.dispose();

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
                /* name of the tool */
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Name: ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black54, fontSize: 20),
                        controller: _nameTC,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                /* image of the tool, cool and the label */
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    /* image tool */
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        //width: MediaQuery.of(context).size.width * 0.4,

                        child: Image.asset(
                          'assets/images/${_selectMaterialTool.image}',
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                          //height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ),
                    ),

                    /* image cool */
                    Positioned(
                      top: 80,
                      left: 70,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: _cool
                            ? new Container(
                                child: Image.asset(
                                  'assets/images/coll.png',
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.center,
                                  //height: MediaQuery.of(context).size.height * 0.15,
                                ),
                              )
                            : new Container(),
                      ),
                    ),
                    Positioned(
                      bottom: 120,
                      right: 30,
                      child: Container(
                        width: 60,
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true) ,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                          //onChanged: (value) => doubleVar = double.parse(value),
                          controller: _lengthTC,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 50,
                      child: Container(
                        width: 60,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _sharpTC,
                        ),
                      ),
                    ),

                    /* label of the data length, sharp, diameter */
                  ],
                ),

                /* label diameter */
                Container(
                  width: 60,
                  child: TextField(
                    controller: _diameterTC,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Switch(
                        value: _cool,
                        onChanged: (value) {
                          setState(() {
                            _cool = !_cool;
                            print('cange the value $_cool');
                          });
                        },
                        //activeTrackColor: Colors.lightGreenAccent,
                        //activeColor: Colors.green,
                      ),
                    ),
                    Text('Flut  '),
                    Container(
                      child: DropdownButton<int>(
                          items: <int>[1, 2, 3, 4, 6, 8, 12]
                              .map((e) => DropdownMenuItem<int>(
                                  value: e, child: Text(e.toString())))
                              .toList(),
                          value: _selectTeeth,
                          onChanged: (item) {
                            print("selezionato ${item}");
                            //context.read<EditTool>().createState()._teethTC;
                            setState(() {
                              _selectTeeth = item;
                            });
                          }),
                    ),
                    DropdownButton<FresaEnum>(
                        items: FresaEnum.values
                            .map((e) => DropdownMenuItem<FresaEnum>(
                                value: e, child: Text(e.text)))
                            .toList(),
                        value: _selectMaterialTool,
                        onChanged: (item) {
                          print("selezionato ${item}");
                          setState(() {
                            _selectMaterialTool = item;
                          });
                        }),
                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.topRight,
                  //width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    child: Text('Salva'),
                    onPressed: () {
                      print('id: ${widget.tool.id} ');

                      Provider.of<ServiceTool>(context, listen: false).update(
                          widget.tool.id,
                          _nameTC.value.text,
                          double.parse(_diameterTC.value.text),
                          double.parse(_sharpTC.value.text),
                          double.parse(_lengthTC.value.text),
                          _selectMaterialTool,
                          //int.parse(_materiaTC.value.text),
                          _selectTeeth,
                          //int.parse(_teethTC.value.text),
                          _cool);
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                    child: Text('Go back'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectMaterialToolNotifier extends ChangeNotifier {
  SelectMaterialToolNotifier(FresaEnum selectedMaterialTool) {
    material = selectedMaterialTool;
  }

  FresaEnum material;

  changeMaterial(FresaEnum material) {
    this.material = material;
    notifyListeners();
  }
}
