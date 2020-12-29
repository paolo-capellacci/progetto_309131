import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool cool = true;
  int _selectTeeth;

  // int _selectMaterial;
  FresaEnum _selectMaterialTool;

  TextEditingController _nameTC;
  TextEditingController _diameterTC;
  TextEditingController _sharpTC;
  TextEditingController _lengthTC;
  //TextEditingController _materiaTC;
  //TextEditingController _teethTC;

  @override
  void initState() {
    super.initState();
    _nameTC = TextEditingController(text: widget.tool.name);
    _diameterTC = TextEditingController(text: widget.tool.diameter.toString());
    _sharpTC = TextEditingController(text: widget.tool.sharp.toString());
    _lengthTC = TextEditingController(text: widget.tool.length.toString());
    //_materiaTC = TextEditingController(text: widget.tool.material.toString());
    //_teethTC = TextEditingController(text: widget.tool.teeth.toString());
    _selectTeeth = widget.tool.teeth;
    _selectMaterialTool = widget.tool.material;
    cool = widget.tool.cool;
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
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Center(
                            child: cool
                                ? new Container(
                              child: Image.asset(
                                'assets/images/coll.png',
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.centerLeft,
                                width: 20,
                              ),
                            )
                                : new Container(),
                          ),
                          /* Consumer<SelectMaterialNotifier>(builder: (BuildContext context, value, Widget child) {
                          return Container(
                              width: 100,
                              child: Image.asset(
                              'assets/images/${value.material.image}',
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.3,
                          ),);
                        },),*/
                          Container(
                            width: 100,
                            child: Image.asset(
                              'assets/images/${_selectMaterialTool.image}',
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ),
                        ],),
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

                            /* menu for select the type of the material Tool */
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

                            /* switch for activate and disactivate the cool */
                            Switch(
                              value: cool,
                              onChanged: (value) {
                                setState(() {
                                cool = !cool;
                                  print('cange the value $cool');
                                });
                              },
                              //activeTrackColor: Colors.lightGreenAccent,
                              //activeColor: Colors.green,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

                // TextField(
                //   controller: nameTC,),
                //SelectTeeth(),
                DropdownButton<int>(
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
                        _selectMaterialTool,
                        //int.parse(_materiaTC.value.text),
                        _selectTeeth,
                        //int.parse(_teethTC.value.text),
                        cool);
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
