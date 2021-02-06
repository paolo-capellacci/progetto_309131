import 'package:equatable/equatable.dart';

import 'tools_enum.dart';

class Tool extends Equatable {

  // attributi di Tool
  final int id;
  final String name;
  final double diameter;
  final double sharp;
  final double length;
  final FresaEnum material;
  final int teeth;
  final bool cool;


  // costruttore
  Tool(
      {this.id,
        this.name,
        this.diameter,
        this.sharp,
        this.length,
        this.material,
        this.teeth,
        this.cool
      });

  @override
  List<Object> get props => [
    id,
    name,
    diameter,
    sharp,
    length,
    material,
    teeth,
    cool
  ];


  Tool.fromJson(Map<String, dynamic> json)
      : id = json[id_column],
        name = json[name_column],
        diameter = json[diameter_column],
        sharp = json[sharp_column],
        length = json[length_column],
        material = FresaEnum.values[json[material_column]],
        teeth = json[teeth_column],
        cool = json[cool_column] == 0 ? false : true;


  static final id_column = 'id';
  static final name_column = 'name';
  static final diameter_column = 'diameter';
  static final sharp_column = 'sharp';
  static final length_column = 'length';
  static final material_column = 'material';
  static final teeth_column = 'teeth';
  static final cool_column = 'cool';



  // Convert a Tool into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      id_column: id,
      name_column: name,
      diameter_column: diameter,
      sharp_column: sharp,
      length_column: length,
      material_column: material.index,
      teeth_column: teeth,
      cool_column: cool ? 1 : 0
    };
  }


}
