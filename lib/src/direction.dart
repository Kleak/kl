library kl.directions;

import 'package:kl/src/exception.dart';

enum _KlDirection { column, columnReverse, row, rowReverse, unset }

class KlFlexDirection {
  static const KlFlexDirection column =
      const KlFlexDirection._(_KlDirection.column);
  static const KlFlexDirection columnReverse =
      const KlFlexDirection._(_KlDirection.columnReverse);
  static const KlFlexDirection row = const KlFlexDirection._(_KlDirection.row);
  static const KlFlexDirection rowReverse =
      const KlFlexDirection._(_KlDirection.rowReverse);
  static const KlFlexDirection unset =
      const KlFlexDirection._(_KlDirection.unset);

  final _KlDirection direction;

  const KlFlexDirection._(this.direction);

  String toStyle() {
    switch (direction) {
      case _KlDirection.column:
        return 'column';
      case _KlDirection.columnReverse:
        return 'column-reverse';
      case _KlDirection.row:
        return 'row';
      case _KlDirection.rowReverse:
        return 'row-reverse';
      case _KlDirection.unset:
        return 'unset';
      default:
        return 'unset';
    }
  }

  static KlFlexDirection fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'column':
        return KlFlexDirection.column;
      case 'column-reverse':
        return KlFlexDirection.columnReverse;
      case 'row':
        return KlFlexDirection.row;
      case 'rowReverse':
        return KlFlexDirection.rowReverse;
      case 'unset':
        return KlFlexDirection.unset;
      default:
        return KlFlexDirection.unset;
    }
  }

  static KlFlexDirection from(/*String|KlDirection*/ value) {
    if (value != null && value is! String && value is! KlFlexDirection) {
      throw new KlTypeValueException(
          value, 'flexDirection', [String, KlFlexDirection]);
    }
    if (value is String) {
      return KlFlexDirection.fromString(value);
    }
    return value;
  }

  String toString() => toStyle();
}
