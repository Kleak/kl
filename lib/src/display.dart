enum _KlDisplay {
  block,
  flex,
}

class KlDisplay {
  static const KlDisplay block = const KlDisplay._(_KlDisplay.block);
  static const KlDisplay flex = const KlDisplay._(_KlDisplay.flex);

  final _KlDisplay display;

  const KlDisplay._(this.display);

  String get _style {
    switch (display) {
      case _KlDisplay.block:
        return 'block';
      case _KlDisplay.flex:
        return 'flex';
      default:
        return 'block';
    }
  }

  String toStyle() => _style;
}