

enum FresaEnum {
  FresaHss,
  FresaHm,
  FresaHmR,
  InsertToolHm,
  InsertToolCer,
  InsertToolDia,
}

extension FresaEnumExt on FresaEnum {
  String get text => toString().replaceFirst('FresaEnum.', '');
  String get image => '$text.png';

  int get value {
    switch (this) {
      case FresaEnum.FresaHss:
        return 5;
      case FresaEnum.FresaHm:
        return 8;
      case FresaEnum.FresaHmR:
        return 10;
      case FresaEnum.InsertToolHm:
        return 11;
      case FresaEnum.InsertToolCer:
        return 15;
      case FresaEnum.InsertToolDia:
        return 16;
    }
  }
}