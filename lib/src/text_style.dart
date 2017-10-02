library kl.text_style;

import 'package:kl/src/color.dart';
import 'package:kl/src/exception.dart';

enum _KlTextTransform {
  uppercase,
  lowercase,
  none,
  capitalize,
  fullSizeKana,
  fullWidth,
}

class KlTextTransform {
  static const KlTextTransform uppercase =
      const KlTextTransform._(_KlTextTransform.uppercase);
  static const KlTextTransform lowercase =
      const KlTextTransform._(_KlTextTransform.lowercase);
  static const KlTextTransform none =
      const KlTextTransform._(_KlTextTransform.none);
  static const KlTextTransform capitalize =
      const KlTextTransform._(_KlTextTransform.capitalize);

  final _KlTextTransform textTransform;

  const KlTextTransform._(this.textTransform);

  String toStyle() {
    switch (textTransform) {
      case _KlTextTransform.none:
        return 'none';
      case _KlTextTransform.lowercase:
        return 'lowercase';
      case _KlTextTransform.uppercase:
        return 'uppercase';
      default:
        return 'none';
    }
  }

  static KlTextTransform fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'none':
        return KlTextTransform.none;
      case 'lowercase':
        return KlTextTransform.lowercase;
      case 'uppercase':
        return KlTextTransform.uppercase;
      default:
        return KlTextTransform.none;
    }
  }

  static KlTextTransform from(/*String|KlTextTransform*/ value) {
    if (value != null && value is! String && value is! KlTextTransform) {
      throw new KlTypeValueException(
          value, 'textTransform', [String, KlTextTransform]);
    }
    if (value is String) {
      return KlTextTransform.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}

enum _KlTextDecoration {
  none,
  underline,
}

class KlTextDecoration {
  static const KlTextDecoration none =
      const KlTextDecoration._(_KlTextDecoration.none);
  static const KlTextDecoration underline =
      const KlTextDecoration._(_KlTextDecoration.underline);

  final _KlTextDecoration textDecoration;

  const KlTextDecoration._(this.textDecoration);

  String toStyle() {
    switch (textDecoration) {
      case _KlTextDecoration.none:
        return 'none';
      case _KlTextDecoration.underline:
        return 'underline';
      default:
        return 'none';
    }
  }

  static KlTextDecoration fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'none':
        return KlTextDecoration.none;
      case 'underline':
        return KlTextDecoration.underline;
      default:
        return KlTextDecoration.none;
    }
  }

  static KlTextDecoration from(/*String|KlTextDecoration*/ value) {
    if (value != null && value is! String && value is! KlTextDecoration) {
      throw new KlTypeValueException(
          value, 'textDecoration', [String, KlTextDecoration]);
    }
    if (value is String) {
      return KlTextDecoration.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}

enum _KlTextAlign {
  right,
  center,
  left,
}

class KlTextAlign {
  static const KlTextAlign right = const KlTextAlign._(_KlTextAlign.right);
  static const KlTextAlign center = const KlTextAlign._(_KlTextAlign.center);
  static const KlTextAlign left = const KlTextAlign._(_KlTextAlign.left);

  final _KlTextAlign textAlign;

  const KlTextAlign._(this.textAlign);

  String toStyle() {
    switch (textAlign) {
      case _KlTextAlign.center:
        return 'center';
      case _KlTextAlign.left:
        return 'left';
      case _KlTextAlign.right:
        return 'right';
      default:
        return 'left';
    }
  }

  static KlTextAlign fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'center':
        return KlTextAlign.center;
      case 'left':
        return KlTextAlign.left;
      case 'right':
        return KlTextAlign.right;
      default:
        return KlTextAlign.left;
    }
  }

  static KlTextAlign from(/*String|KlTextAlign*/ value) {
    if (value != null && value is! String && value is! KlTextAlign) {
      throw new KlTypeValueException(value, 'textAlign', [String, KlTextAlign]);
    }
    if (value is String) {
      return KlTextAlign.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}

class KlTextStyle {
  final String fontFamily;
  final int fontSize;
  final String fontWeight;
  final KlColor color;
  final KlTextTransform textTransform;
  final KlTextDecoration textDecoration;
  final KlTextAlign textAlign;

  const KlTextStyle(
      {this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textTransform,
      this.textDecoration,
      this.textAlign});
}
