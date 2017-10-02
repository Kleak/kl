library kl.display;

import 'exception.dart';

enum _KlDisplay { block, flex, unset, fixed }

class KlDisplay {
  static const KlDisplay block = const KlDisplay._(_KlDisplay.block);
  static const KlDisplay flex = const KlDisplay._(_KlDisplay.flex);
  static const KlDisplay unset = const KlDisplay._(_KlDisplay.unset);
  static const KlDisplay fixed = const KlDisplay._(_KlDisplay.fixed);

  final _KlDisplay display;

  const KlDisplay._(this.display);

  String toStyle() {
    switch (display) {
      case _KlDisplay.block:
        return 'block';
      case _KlDisplay.flex:
        return 'flex';
      case _KlDisplay.unset:
        return 'unset';
      case _KlDisplay.fixed:
        return 'fixed';
      default:
        return 'block';
    }
  }

  static KlDisplay fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'block':
        return KlDisplay.block;
      case 'flex':
        return KlDisplay.flex;
      case 'unset':
        return KlDisplay.unset;
      case 'fixed':
        return KlDisplay.fixed;
      default:
        return KlDisplay.block;
    }
  }

  static KlDisplay from(/*String|KlDisplay*/ value) {
    if (value != null && value is! String && value is! KlDisplay) {
      throw new KlTypeValueException(value, 'display', [String, KlDisplay]);
    }
    if (value is String) {
      return KlDisplay.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}
