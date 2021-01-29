

enum FresaEnum {
  HssCutter,
  HmICutter,
  HmRCutter,
  HmInsertTool,
  CerInsertTool,
  DiaInsertTool,
}

extension FresaEnumExt on FresaEnum {
  String get text => toString().replaceFirst('FresaEnum.', '');
  String get image => '$text.png';

  int get value {
    switch (this) {
      case FresaEnum.HssCutter:
        return 5;
      case FresaEnum.HmICutter:
        return 8;
      case FresaEnum.HmRCutter:
        return 10;
      case FresaEnum.HmInsertTool:
        return 11;
      case FresaEnum.CerInsertTool:
        return 15;
      case FresaEnum.DiaInsertTool:
        return 16;
    }
  }
}