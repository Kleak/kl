import 'package:kl/src/color.dart';

enum _KlTextTransform {
  uppercase,
  lowercase,
  none,
  capitalize,
  fullSizeKana,
  fullWidth,
}

class KlTextTransform {
  static const KlTextTransform uppercase = const KlTextTransform._(_KlTextTransform.uppercase);
  static const KlTextTransform lowercase = const KlTextTransform._(_KlTextTransform.lowercase);
  static const KlTextTransform none = const KlTextTransform._(_KlTextTransform.none);
  static const KlTextTransform capitalize = const KlTextTransform._(_KlTextTransform.capitalize);

  final _KlTextTransform textTransform;

  const KlTextTransform._(this.textTransform);

  String get _style {
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

  String toStyle() => _style;
}

enum _KlTextDecoration {
  none,
  underline,
}

class KlTextDecoration {
  static const KlTextDecoration none = const KlTextDecoration._(_KlTextDecoration.none);
  static const KlTextDecoration underline = const KlTextDecoration._(_KlTextDecoration.underline);

  final _KlTextDecoration textDecoration;

  const KlTextDecoration._(this.textDecoration);

  String get _style {
    switch (textDecoration) {
      case _KlTextDecoration.none:
        return 'none';
      case _KlTextDecoration.underline:
        return 'underline';
      default:
        return 'none';
    }
  }

  String toStyle() => _style;
}

class KlTextStyle {
  final String fontFamily;
  final int fontSize;
  final KlColor color;
  final KlTextTransform textTransform;
  final KlTextDecoration textDecoration;

  const KlTextStyle(
      {this.fontFamily, this.fontSize, this.color, this.textTransform, this.textDecoration});
}
