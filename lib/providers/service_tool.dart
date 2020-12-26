import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:progetto_309131/models/database_tool.dart';
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
        material: 2,
        teeth: 4,
        cool: 1,
        materialWork: 2,
        workHeight: 12,
        workPercent: 30);
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

  Future<int> countTools() async {
    final countRows = await dbTool.queryRowCount();
    return countRows;
  }

  void update(int idTool, String name, double diameter, double sharp,
      double length, int material, int teeth, int cool) async {
    // row to update
    /*
    Map<String, dynamic> row = {
      DatabaseTool.Id   : 1,
      DatabaseTool.name : 'Tool 03',
      DatabaseTool.diameter  : 32.00,
      DatabaseTool.sharp  : 20.00,
      DatabaseTool.length  : 40.01,
      DatabaseTool.material  : 3,
      DatabaseTool.teeth : 3
    };
    */
    final tool = Tool(
        id: idTool,
        name: name,
        diameter: diameter,
        sharp: sharp,
        length: length,
        material: material,
        teeth: teeth,
        cool: cool,
        materialWork: 2,
        workHeight: 12,
        workPercent: 30);

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
