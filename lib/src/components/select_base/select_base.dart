import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';

class AlSelectItem {
  final String id;
  final String value;

  AlSelectItem(this.id, this.value);

  @override
  String toString() => "$id $value";
}

enum AlSelectType {
  none,
  onlyOne,
  multiple,
}

@Component(
  selector: 'akl-select-base',
)
class KlSelectBase implements OnDestroy {
  final ChangeDetectorRef _changeDetectorRef;
  List<AlSelectItem> _items = [];
  List<AlSelectItem> _selectedItems = [];
  AlSelectType _type = AlSelectType.none;

  StreamController<AlSelectItem> onSelectItemController;

  @Input('type')
  set type(AlSelectType type) {
    _type = type ?? _type;
    if (type != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  @Input('items')
  set items(List<AlSelectItem> items) {
    _items = items ?? _items;
    if (items != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  @Input('selectedItems')
  set selectedItems(List<AlSelectItem> selectedItems) {
    _selectedItems = selectedItems ?? _selectedItems;
    if (selectedItems != null) {
      _changeDetectorRef.markForCheck();
    }
  }

  KlSelectBase(this._changeDetectorRef) {
    onSelectItemController = new StreamController();
  }

  bool get isNone => _type == AlSelectType.none;
  List<AlSelectItem> get items => _items;
  List<AlSelectItem> get selectedItems => _selectedItems;
  AlSelectType get type => _type;

  @Output('selectItem')
  Stream<AlSelectItem> get onSelectItem => onSelectItemController.stream;

  void ngOnDestroy() {
    onSelectItemController?.close();
  }

  void selectBaseItem(MouseEvent event, AlSelectItem item) {
    event.stopPropagation();
    onSelectItemController.add(item);
  }

  bool isSelected(AlSelectItem item) {
    if (isNone) {
      return false;
    }
    return _selectedItems.firstWhere(
            (AlSelectItem selectedItem) => selectedItem.id == item.id,
            orElse: () => null) !=
        null;
  }
}
