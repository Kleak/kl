import 'package:kl/src/color.dart';

enum KlBorderStyle {
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

class KlBorder {
  final int size;
  final KlBorderStyle style;
  final KlColor color;

  const KlBorder({this.size, this.style, this.color});

  String get _borderType {
    switch (style) {
      case KlBorderStyle.none:
        return 'none';
      case KlBorderStyle.hidden:
        return 'hidden';
      case KlBorderStyle.dotted:
        return 'dotted';
      case KlBorderStyle.dashed:
        return 'dashed';
      case KlBorderStyle.solid:
        return 'solid';
      case KlBorderStyle.double:
        return 'double';
      case KlBorderStyle.groove:
        return 'groove';
      case KlBorderStyle.ridge:
        return 'ridge';
      case KlBorderStyle.inset:
        return 'inset';
      case KlBorderStyle.outset:
        return 'outset';
      default:
        return 'solid';
    }
  }

  String toStyle() {
    final sb = new StringBuffer();
    if (size != null) {
      sb.write("${size}px");
    }
    if (style != null) {
      sb.write(" $_borderType");
    }
    if (color != null) {
      sb.write(" ${color.toStyle()}");
    }
    return sb.toString();
  }
}

class KlBoxBorder {
  final KlBorder top;
  final KlBorder bottom;
  final KlBorder left;
  final KlBorder right;

  KlBoxBorder.all(KlBorder border)
      : top = border,
        bottom = border,
        right = border,
        left = border;

  KlBoxBorder.only({this.top, this.right, this.bottom, this.left});
}
