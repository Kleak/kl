library kl.justify_content;

import 'package:kl/src/exception.dart';

enum _KlJjustifyContent {
  unset,
  flexStart,
  flexEnd,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

class KlJustifyContent {
  static const KlJustifyContent unset =
      const KlJustifyContent._(_KlJjustifyContent.unset);
  static const KlJustifyContent flexStart =
      const KlJustifyContent._(_KlJjustifyContent.flexStart);
  static const KlJustifyContent flexEnd =
      const KlJustifyContent._(_KlJjustifyContent.flexEnd);
  static const KlJustifyContent center =
      const KlJustifyContent._(_KlJjustifyContent.center);
  static const KlJustifyContent spaceBetween =
      const KlJustifyContent._(_KlJjustifyContent.spaceBetween);
  static const KlJustifyContent spaceAround =
      const KlJustifyContent._(_KlJjustifyContent.spaceAround);
  static const KlJustifyContent spaceEvenly =
      const KlJustifyContent._(_KlJjustifyContent.spaceEvenly);

  final _KlJjustifyContent justifyContent;

  const KlJustifyContent._(this.justifyContent);

  String toStyle() {
    switch (justifyContent) {
      case _KlJjustifyContent.flexStart:
        return 'flex-start';
      case _KlJjustifyContent.flexEnd:
        return 'flex-end';
      case _KlJjustifyContent.center:
        return 'center';
      case _KlJjustifyContent.spaceAround:
        return 'space-around';
      case _KlJjustifyContent.spaceBetween:
        return 'space-between';
      case _KlJjustifyContent.spaceEvenly:
        return 'space-evenly';
      case _KlJjustifyContent.unset:
        return 'unset';
      default:
        return 'unset';
    }
  }

  static KlJustifyContent fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'flex-start':
        return KlJustifyContent.flexStart;
      case 'flex-end':
        return KlJustifyContent.flexEnd;
      case 'center':
        return KlJustifyContent.center;
      case 'space-around':
        return KlJustifyContent.spaceAround;
      case 'space-between':
        return KlJustifyContent.spaceBetween;
      case 'space-evenly':
        return KlJustifyContent.spaceEvenly;
      case 'unset':
        return KlJustifyContent.unset;
      default:
        return KlJustifyContent.unset;
    }
  }

  static KlJustifyContent from(/*String|KlJustifyContent*/ value) {
    if (value != null && value is! String && value is! KlJustifyContent) {
      throw new KlTypeValueException(
          value, 'justifyContent', [String, KlJustifyContent]);
    }
    if (value is String) {
      return KlJustifyContent.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}
