library kl.flex_wrap;

import 'package:kl/src/exception.dart';

enum _KlFlexWrap {
  wrap,
  noWrap,
  reverseWrap,
}

class KlFlexWrap {
  static const KlFlexWrap wrap = const KlFlexWrap._(_KlFlexWrap.wrap);
  static const KlFlexWrap noWrap = const KlFlexWrap._(_KlFlexWrap.noWrap);
  static const KlFlexWrap reverseWrap =
      const KlFlexWrap._(_KlFlexWrap.reverseWrap);

  final _KlFlexWrap flexWrap;

  const KlFlexWrap._(this.flexWrap);

  String toStyle() {
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

  static KlFlexWrap fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'wrap':
        return KlFlexWrap.wrap;
      case 'noWrap':
        return KlFlexWrap.noWrap;
      case 'reverse-wrap':
        return KlFlexWrap.reverseWrap;
      default:
        return KlFlexWrap.wrap;
    }
  }

  static KlFlexWrap from(/*String|KlFlexWrap*/ value) {
    if (value != null && value is! String && value is! KlFlexWrap) {
      throw new KlTypeValueException(value, 'flexWrap', [String, KlFlexWrap]);
    }
    if (value is String) {
      return KlFlexWrap.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}
