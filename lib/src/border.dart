library kl.border;

import 'package:kl/kl.dart';
import 'package:kl/src/color.dart';

enum _KlBorderStyle {
  none,
  hidden,
  dotted,
  dashed,
  solid,
  double,
  groove,
  ridge,
  inset,
  outset,
}

class KlBorderStyle {
  static const KlBorderStyle none = const KlBorderStyle._(_KlBorderStyle.none);
  static const KlBorderStyle hidden =
      const KlBorderStyle._(_KlBorderStyle.hidden);
  static const KlBorderStyle dotted =
      const KlBorderStyle._(_KlBorderStyle.dotted);
  static const KlBorderStyle dashed =
      const KlBorderStyle._(_KlBorderStyle.dashed);
  static const KlBorderStyle solid =
      const KlBorderStyle._(_KlBorderStyle.solid);
  static const KlBorderStyle double =
      const KlBorderStyle._(_KlBorderStyle.double);
  static const KlBorderStyle groove =
      const KlBorderStyle._(_KlBorderStyle.groove);
  static const KlBorderStyle ridge =
      const KlBorderStyle._(_KlBorderStyle.ridge);
  static const KlBorderStyle inset =
      const KlBorderStyle._(_KlBorderStyle.inset);
  static const KlBorderStyle outset =
      const KlBorderStyle._(_KlBorderStyle.outset);

  final _KlBorderStyle border;

  const KlBorderStyle._(this.border);

  String toStyle() {
    switch (border) {
      case _KlBorderStyle.none:
        return 'none';
      case _KlBorderStyle.hidden:
        return 'hidden';
      case _KlBorderStyle.dotted:
        return 'dotted';
      case _KlBorderStyle.dashed:
        return 'dashed';
      case _KlBorderStyle.solid:
        return 'solid';
      case _KlBorderStyle.double:
        return 'double';
      case _KlBorderStyle.groove:
        return 'groove';
      case _KlBorderStyle.ridge:
        return 'ridge';
      case _KlBorderStyle.inset:
        return 'inset';
      case _KlBorderStyle.outset:
        return 'outset';
      default:
        return 'solid';
    }
  }

  static KlBorderStyle fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'none':
        return KlBorderStyle.none;
      case 'hidden':
        return KlBorderStyle.hidden;
      case 'dotted':
        return KlBorderStyle.dotted;
      case 'dashed':
        return KlBorderStyle.dashed;
      case 'solid':
        return KlBorderStyle.solid;
      case 'double':
        return KlBorderStyle.double;
      case 'groove':
        return KlBorderStyle.groove;
      case 'ridge':
        return KlBorderStyle.ridge;
      case 'inset':
        return KlBorderStyle.inset;
      case 'outset':
        return KlBorderStyle.outset;
      default:
        return KlBorderStyle.solid;
    }
  }

  static KlBorderStyle from(/*String|KlBorderStyle*/ value) {
    if (value != null && value is! String && value is! KlBorderStyle) {
      throw new KlTypeValueException(
          value, 'borderStyle', [String, KlBorderStyle]);
    }
    if (value is String) {
      return KlBorderStyle.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}

class KlBorder {
  final int size;
  final KlBorderStyle style;
  final KlColor color;

  const KlBorder({this.size, this.style, this.color});

  String toStyle() {
    final sb = new StringBuffer();
    if (size != null) {
      sb.write("${size}px");
    }
    if (style != null) {
      sb.write(" ${style.toStyle()}");
    }
    if (color != null) {
      sb.write(" ${color.toStyle()}");
    }
    return sb.toString();
  }

  String toString() => toStyle();
}

class KlBoxBorder {
  final KlBorder top;
  final KlBorder bottom;
  final KlBorder left;
  final KlBorder right;

  const KlBoxBorder.all(KlBorder border)
      : top = border,
        bottom = border,
        right = border,
        left = border;

  const KlBoxBorder.only({this.top, this.right, this.bottom, this.left});
}
