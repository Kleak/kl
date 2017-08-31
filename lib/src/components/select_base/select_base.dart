import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';

class KlSelectItem {
  final String id;
  final String value;

  const KlSelectItem(this.id, this.value);

  @override
  String toString() => "$id $value";
}

enum KlSelectType {
  none,
  onlyOne,
  multiple,
}

@Component(
  selector: 'kl-select-base',
)
class KlSelectBase implements OnDestroy {
  final ChangeDetectorRef _changeDetectorRef;
  List<KlSelectItem> _items = [];
  List<KlSelectItem> _selectedItems = [];
  KlSelectType _type = KlSelectType.none;

  StreamController<KlSelectItem> onSelectItemController;

  @Input('type')
  set type(KlSelectType type) {
    _type = type ?? _type;
    if (type != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  @Input('items')
  set items(List<KlSelectItem> items) {
    _items = items ?? _items;
    if (items != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  @Input('selectedItems')
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
