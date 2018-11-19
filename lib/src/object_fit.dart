library kl.object_fit;

import 'package:kl/kl.dart';

enum _KlObjectFit { fill, contain, cover, none, scaleDown, auto }

class KlObjectFit {
  static const KlObjectFit fill = const KlObjectFit._(_KlObjectFit.fill);
  static const KlObjectFit contain = const KlObjectFit._(_KlObjectFit.contain);
  static const KlObjectFit cover = const KlObjectFit._(_KlObjectFit.cover);
  static const KlObjectFit none = const KlObjectFit._(_KlObjectFit.none);
  static const KlObjectFit scaleDown =
      const KlObjectFit._(_KlObjectFit.scaleDown);
  static const KlObjectFit auto = const KlObjectFit._(_KlObjectFit.auto);

  final _KlObjectFit size;

  const KlObjectFit._(this.size);

  String toStyle() {
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

  static KlObjectFit fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'fill':
        return KlObjectFit.fill;
      case 'contain':
        return KlObjectFit.contain;
      case 'cover':
        return KlObjectFit.cover;
      case 'none':
        return KlObjectFit.none;
      case 'scale-down':
        return KlObjectFit.scaleDown;
      default:
        return KlObjectFit.auto;
    }
  }

  static KlObjectFit from(/*String|KlObjectFit*/ value) {
    if (value != null && value is! String && value is! KlObjectFit) {
      throw new KlTypeValueException(value, 'objectFit', [String, KlObjectFit]);
    }
    if (value is String) {
      return KlObjectFit.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}
