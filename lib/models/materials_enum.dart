

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
        return 40;
      case MaterialEnum.Plastic:
        return 30;
      case MaterialEnum.Alluminium:
        return 20;
      case MaterialEnum.Iron:
        return 10;
      case MaterialEnum.Steel:
        return 5;
      case MaterialEnum.TemperateSteel:
        return 2;
    }
  }
}