enum _KlObjectFit { fill, contain, cover, none, scaleDown }

class KlObjectFit {
  static const KlObjectFit fill = const KlObjectFit._(_KlObjectFit.fill);
  static const KlObjectFit cover = const KlObjectFit._(_KlObjectFit.cover);

  final _KlObjectFit size;

  const KlObjectFit._(this.size);

  String get _style {
    switch (size) {
      case _KlObjectFit.fill:
        return 'fill';
      case _KlObjectFit.cover:
        return 'cover';
      case _KlObjectFit.contain:
        return 'contain';
      default:
        return 'auto';
    }
  }

  String toStyle() => _style;
}
