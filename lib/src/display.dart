enum _KlDisplay {
  block,
  flex,
  unset,
}

class KlDisplay {
  static const KlDisplay block = const KlDisplay._(_KlDisplay.block);
  static const KlDisplay flex = const KlDisplay._(_KlDisplay.flex);
  static const KlDisplay unset = const KlDisplay._(_KlDisplay.unset);

  final _KlDisplay display;

  const KlDisplay._(this.display);

  String get _style {
    switch (display) {
      case _KlDisplay.block:
        return 'block';
      case _KlDisplay.flex:
        return 'flex';
      case _KlDisplay.unset:
        return 'unset';
      default:
        return 'block';
    }
  }

  String toStyle() => _style;
}