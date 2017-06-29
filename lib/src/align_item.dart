enum _KlAlignItem {
  start,
  end,
  baseline,
  stretch,
  center,
}

class KlAlignItem {
  static const KlAlignItem start = const KlAlignItem._(_KlAlignItem.start);
  static const KlAlignItem end = const KlAlignItem._(_KlAlignItem.end);
  static const KlAlignItem baseline =
      const KlAlignItem._(_KlAlignItem.baseline);
  static const KlAlignItem stretch = const KlAlignItem._(_KlAlignItem.stretch);
  static const KlAlignItem center = const KlAlignItem._(_KlAlignItem.center);

  final _KlAlignItem alignItem;

  const KlAlignItem._(this.alignItem);

  String toStyle() {
    switch (alignItem) {
      case _KlAlignItem.start:
        return 'start';
      case _KlAlignItem.end:
        return 'end';
      case _KlAlignItem.baseline:
        return 'baseline';
      case _KlAlignItem.stretch:
        return 'stretch';
      case _KlAlignItem.center:
        return 'center';
      default:
        return 'start';
    }
  }
}
