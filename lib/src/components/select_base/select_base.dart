library kl.components.select_base;

import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:kl/src/exception.dart';

class KlSelectItem<Value> {
  final String id;
  final Value value;

  const KlSelectItem(this.id, this.value);

  @override
  String toString() => "$id $value";
}

enum _KlSelectType {
  none,
  onlyOne,
  multiple,
}

class KlSelectType {
  static const KlSelectType none = const KlSelectType._(_KlSelectType.none);
  static const KlSelectType onlyOne =
      const KlSelectType._(_KlSelectType.onlyOne);
  static const KlSelectType multiple =
      const KlSelectType._(_KlSelectType.multiple);

  final _KlSelectType type;

  const KlSelectType._(this.type);

  static KlSelectType fromString(String value) {
    if (value == null) {
      return null;
    }
    switch (value) {
      case 'none':
        return KlSelectType.none;
      case 'onlyOne':
        return KlSelectType.onlyOne;
      case 'multiple':
        return KlSelectType.multiple;
      default:
        return KlSelectType.none;
    }
  }

  static KlSelectType from(/*String|KlSelectType*/ value) {
    if (value != null && value is! String && value is! KlSelectType) {
      throw new KlTypeValueException(
          value, 'selectType', [String, KlSelectType]);
    }
    if (value is String) {
      return KlSelectType.fromString(value);
    }
    return value;
  }
}

@Component(
  selector: 'kl-select-base',
  template: '',
)
class KlSelectBase implements OnDestroy {
  final ChangeDetectorRef _changeDetectorRef;
  List<KlSelectItem> _items = [];
  List<KlSelectItem> _selectedItems = [];
  KlSelectType _type = KlSelectType.none;

  StreamController<KlSelectItem> onSelectItemController;

  @Input()
  set type(/*String|KlSelectType*/ value) {
    _type = KlSelectType.from(value) ?? _type;
    if (type != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  @Input()
  set items(List<KlSelectItem> items) {
    _items = items ?? _items;
    if (items != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  @Input()
  set selectedItems(List<KlSelectItem> selectedItems) {
    _selectedItems = selectedItems ?? _selectedItems;
    if (selectedItems != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  KlSelectBase(this._changeDetectorRef) {
    onSelectItemController = new StreamController();
  }

  bool get isNone => _type == KlSelectType.none;

  List<KlSelectItem> get items => _items;

  List<KlSelectItem> get selectedItems => _selectedItems;

  KlSelectType get type => _type;

  @Output('selectItem')
  Stream<KlSelectItem> get onSelectItem => onSelectItemController.stream;

  void ngOnDestroy() {
    onSelectItemController?.close();
  }

  void selectBaseItem(MouseEvent event, KlSelectItem item) {
    event.stopPropagation();
    onSelectItemController.add(item);
  }

  bool isSelected(KlSelectItem item) {
    if (isNone) {
      return false;
    }
    return _selectedItems.firstWhere(
            (KlSelectItem selectedItem) => selectedItem.id == item.id,
            orElse: () => null) !=
        null;
  }
}
