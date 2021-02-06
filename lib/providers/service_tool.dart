import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:progetto_309131/models/database_tool.dart';
import 'package:progetto_309131/models/tools_enum.dart';
import 'package:progetto_309131/models/tool.dart';


enum ServiceToolsStatus { loading, error, data }

class ServiceTool extends ChangeNotifier {
  final dbTool = DatabaseTool.instance;

  ServiceToolsStatus status = ServiceToolsStatus.loading;

  Tool selectedTool;

  List<Tool> tools = [];

  Future insert() async {


    final tool = Tool(
        name: 'Tool 000',
        diameter: 12.00,
        sharp: 12.00,
        length: 50.00,
        material: FresaEnum.HmRCutter,
        teeth: 4,
        cool: true

    );
    final id = await dbTool.insert(tool);
    print('inserted row id: $id');
    getAllTools();
  }

  Future<List<Tool>> getAllTools() async {
    status = ServiceToolsStatus.loading;
    notifyListeners();

    try {
      tools = await dbTool.getAllTools();

      if (tools.isEmpty) {

        await insert();
        print('insert record');

        tools = await dbTool.getAllTools();
      }
      if (selectedTool == null) {
        selectedTool = tools[0];
      }
      status = ServiceToolsStatus.data;
    } catch (ex) {
      print(ex);
      status = ServiceToolsStatus.error;
    }
    notifyListeners();
  }

  setSelectedTool(index) {
    selectedTool = tools[index];
    notifyListeners();
  }

  void selectTool(bool isSelected,tool) {
    /*
    bool trovato = false;
    for(int i = 0 ; i < this.tools.length; i++){
      if(this.tools[i] == tool)
        trovato = true;
    }
    if(trovato == false && this.tools[0] == tool)
      isSelected = true;*/

    if (isSelected) {
      this.selectedTool = tool;

    }
  }



  Future<int> countTools() async {
    final countRows = await dbTool.queryRowCount();
    return countRows;
  }

  void update(int idTool, String name, double diameter, double sharp,
      double length, FresaEnum material, int teeth, bool cool) async {
    // row to update

    final tool = Tool(
        id: idTool,
        name: name,
        diameter: diameter,
        sharp: sharp,
        length: length,
        material: material,
        teeth: teeth,
        cool: cool,

    );

    //aggiorna tools
    final rowsAffected = await dbTool.update(tool);
    print('updated $rowsAffected tool(${idTool})');
    // Aggiorna lista tools
    getAllTools();
    // notifyListeners();
  }

  void delete(int idTool) async {
    // Assuming that the number of rows is the id for the last row.

    //final id = await dbTool.queryRowCount();

    final tool = Tool(id: idTool);
    final rowsDeleted = await dbTool.delete(tool);

    print('deleted $rowsDeleted tool(s): row ${idTool}');

    getAllTools();
    //notifyListeners();
  }
}
