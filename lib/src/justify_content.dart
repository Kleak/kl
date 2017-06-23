enum _KlJjustifyContent {
  unset,
  flexStart,
  flexEnd,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

class KlJustifyContent {
  static const KlJustifyContent unset = const KlJustifyContent._(_KlJjustifyContent.unset);
  static const KlJustifyContent flexStart =
      const KlJustifyContent._(_KlJjustifyContent.flexStart);
  static const KlJustifyContent flexEnd =
      const KlJustifyContent._(_KlJjustifyContent.flexEnd);
  static const KlJustifyContent center =
      const KlJustifyContent._(_KlJjustifyContent.center);
  static const KlJustifyContent spaceBetween =
      const KlJustifyContent._(_KlJjustifyContent.spaceBetween);
  static const KlJustifyContent spaceAround =
      const KlJustifyContent._(_KlJjustifyContent.spaceAround);
  static const KlJustifyContent spaceEvenly =
      const KlJustifyContent._(_KlJjustifyContent.spaceEvenly);

  final _KlJjustifyContent justifyContent;

  const KlJustifyContent._(this.justifyContent);

  String get _style {
    switch (justifyContent) {
      case _KlJjustifyContent.flexStart:
        return 'flex-start';
      case _KlJjustifyContent.flexEnd:
        return 'flex-end';
      case _KlJjustifyContent.center:
        return 'center';
      case _KlJjustifyContent.spaceAround:
        return 'space-around';
      case _KlJjustifyContent.spaceBetween:
        return 'space-between';
      case _KlJjustifyContent.spaceEvenly:
        return 'space-evenly';
      case _KlJjustifyContent.unset:
        return 'unset';
      default:
        return 'unset';
    }
  }

  String toStyle() => _style;
}
