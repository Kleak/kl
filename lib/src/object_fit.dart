enum _KlObjectFit { fill, contain, cover, none, scaleDown }

class KlObjectFit {
  static const KlObjectFit fill = const KlObjectFit._(_KlObjectFit.fill);
  static const KlObjectFit contain = const KlObjectFit._(_KlObjectFit.contain);
  static const KlObjectFit cover = const KlObjectFit._(_KlObjectFit.cover);
  static const KlObjectFit none = const KlObjectFit._(_KlObjectFit.none);
  static const KlObjectFit scaleDown = const KlObjectFit._(_KlObjectFit.scaleDown);

  final _KlObjectFit size;

  const KlObjectFit._(this.size);

  String get _style {
    switch (size) {
      case _KlObjectFit.fill:
        return 'fill';
      case _KlObjectFit.contain:
        return 'contain';
      case _KlObjectFit.cover:
        return 'cover';
      case _KlObjectFit.none:
        return 'none';
      case _KlObjectFit.scaleDown:
        return 'scale-down';
      default:
        return 'auto';
    }
  }

  String toStyle() => _style;
}
