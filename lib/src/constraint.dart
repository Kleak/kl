library kl.constraint;

class KlConstraint {
  final _minWidth;
  final _minHeight;
  final _maxWidth;
  final _maxHeight;
  final _width;
  final _height;

  const KlConstraint(
      {dynamic minWidth,
      dynamic minHeight,
      dynamic maxWidth,
      dynamic maxHeight,
      dynamic width,
      dynamic height})
      : _minWidth = minWidth,
        _maxHeight = maxHeight,
        _maxWidth = maxWidth,
        _minHeight = minHeight,
        _width = width,
        _height = height;

  String get minHeight => _normalize(_minHeight);

  String get maxWidth => _normalize(_maxWidth);

  String get maxHeight => _normalize(_maxHeight);

  String get width => _normalize(_width);

  String get height => _normalize(_height);

  String get minWidth => _normalize(_minWidth);
}

String _normalize(value) {
  if (value == null) {
    return value;
  }
  final val = "$value";
  if (val.isEmpty) {
    return val;
  }
  if (val.endsWith("px") == false) {
    return "${val}px";
  }
  return val;
}
