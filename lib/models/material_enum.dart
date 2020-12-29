enum MaterialEnum {
  Wood,
  Plastic,
  Alluminium,
  Iron,
  Steel,
  TemperateStell,
}

extension MaterialEnumExt on MaterialEnum {
  String get text => toString().replaceFirst('MaterialEnum.', '');
  String get image => '$text.png';

  int get velocity {
    switch (this) {
      case MaterialEnum.Wood:
        return 5;
      case MaterialEnum.Plastic:
        return 8;
      case MaterialEnum.Alluminium:
        return 10;
      case MaterialEnum.Iron:
        return 11;
      case MaterialEnum.Steel:
        return 15;
      case MaterialEnum.TemperateStell:
        return 16;
    }
  }
}