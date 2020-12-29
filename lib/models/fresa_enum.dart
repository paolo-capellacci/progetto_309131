enum FresaEnum {
  fresaHm,
  fresaHmR,
  fresaHss,
  insertToolCer,
  insertToolDia,
  insertToolHm,
}

extension FresaEnumExt on FresaEnum {
  String get text => toString().replaceFirst('FresaEnum.', '');
  String get image => '$text.png';

  int get velocity {
    switch (this) {
      case FresaEnum.fresaHss:
        return 5;
      case FresaEnum.fresaHm:
        return 8;
      case FresaEnum.fresaHmR:
        return 10;
      case FresaEnum.insertToolHm:
        return 11;
      case FresaEnum.insertToolCer:
        return 15;
      case FresaEnum.insertToolDia:
        return 16;
    }
  }
}