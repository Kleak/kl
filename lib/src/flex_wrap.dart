enum _KlFlexWrap {
  wrap,
  noWrap,
  reverseWrap,
}

class KlFlexWrap {
  static const KlFlexWrap wrap = const KlFlexWrap._(_KlFlexWrap.wrap);
  static const KlFlexWrap noWrap = const KlFlexWrap._(_KlFlexWrap.noWrap);
  static const KlFlexWrap reverseWrap = const KlFlexWrap._(_KlFlexWrap.reverseWrap);

  final _KlFlexWrap flexWrap;

  const KlFlexWrap._(this.flexWrap);

  String get _style {
    switch (flexWrap) {
      case _KlFlexWrap.wrap:
        return 'wrap';
      case _KlFlexWrap.noWrap:
        return 'noWrap';
      case _KlFlexWrap.reverseWrap:
        return 'reverse-wrap';
      default:
        return 'wrap';
    }
  }

  String toStyle() => _style;
}