

enum MaterialEnum {
  Wood,
  Plastic,
  Alluminium,
  Iron,
  Steel,
  TemperateSteel,
}

extension MaterialEnumExt on MaterialEnum {
  String get text => toString().replaceFirst('MaterialEnum.', '');
  String get image => '$text.png';

  int get value {
    switch (this) {
      case MaterialEnum.Wood:
        return 2;
      case MaterialEnum.Plastic:
        return 5;
      case MaterialEnum.Alluminium:
        return 10;
      case MaterialEnum.Iron:
        return 40;
      case MaterialEnum.Steel:
        return 60;
      case MaterialEnum.TemperateSteel:
        return 80;
    }
  }
}