import 'package:equatable/equatable.dart';

class Tool extends Equatable {
  static final id_column = 'id';
  static final name_column = 'name';
  static final diameter_column = 'diameter';
  static final sharp_column = 'sharp';
  static final length_column = 'length';
  static final material_column = 'material';
  static final teeth_column = 'teeth';
  static final cool_column = 'cool';

  static final materialWork_column = 'materialWork';
  static final workHeight_column = 'workHeight';
  static final workPercent_column = 'workPercent';

  static final materialsImage = [
    'material0',
    'material1',
    'material2',
    'material3',
    'material4',
    'material5'
  ];
  static final materialTools = [
    'fresaHss',
    'fresaHm',
    'fresaHmR',
    'insertToolHm',
    'insertToolCer',
    'insertToolDia'
  ];
  static final materialMaterial = {
    'Wood',
    'Plastic',
    'Aluminium',
    'Iron',
    'Steel',
    'Tempered Steel'
  };

  // Update the Tool class to include a `toMap` method.
  final int id;
  final String name;
  final double diameter;
  final double sharp;
  final double length;
  final int material;
  final int teeth;
  final int cool;

  final int materialWork;
  final double workHeight;
  final int workPercent;

  Tool(
      {this.id,
        this.name,
        this.diameter,
        this.sharp,
        this.length,
        this.material,
        this.teeth,
        this.cool,
        this.materialWork,
        this.workHeight,
        this.workPercent});

  @override
  List<Object> get props => [
    id,
    name,
    diameter,
    sharp,
    length,
    material,
    teeth,
    cool,
    materialWork,
    workHeight,
    workPercent,
  ];

  // Convert a Tool into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      id_column: id,
      name_column: name,
      diameter_column: diameter,
      sharp_column: sharp,
      length_column: length,
      material_column: material,
      teeth_column: teeth,
      cool_column: cool,
      materialWork_column: materialWork,
      workHeight_column: workHeight,
      workPercent_column: workPercent
    };
  }

  Tool.fromJson(Map<String, dynamic> json)
      : id = json[id_column],
        name = json[name_column],
        diameter = json[diameter_column],
        sharp = json[sharp_column],
        length = json[length_column],
        material = json[material_column],
        teeth = json[teeth_column],
        cool = json[cool_column],
        materialWork = json[materialWork_column],
        workHeight = json[workHeight_column],
        workPercent = json[workPercent_column];


}
