library kl.directives.container;

import 'package:angular/angular.dart';
import 'package:kl/kl.dart';
import 'package:kl/src/align_item.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/display.dart';
import 'package:kl/src/flex_wrap.dart';

@Directive(selector: 'kl-container, [kl-container]')
class KlContainer extends KlBox {
  KlFlexDirection _flexDirection;
  KlAlignItem _alignItems;
  KlJustifyContent _justifyContent;
  KlFlexWrap _flexWrap;

  @Input()
  set alignItems(/*String|KlAlignItem*/ value) {
    _alignItems = KlAlignItem.from(value) ?? _alignItems;
    element.style.alignItems =
        _alignItems?.toStyle(); // fixme: seems to not work
  }

  @Input()
  set flexWrap(/*String|KlFlexWrap*/ value) {
    _flexWrap = KlFlexWrap.from(value) ?? _flexWrap;
    element.style.flexWrap = _flexWrap?.toStyle();
  }

  @Input()
  set justifyContent(/*String|KlJustifyContent*/ value) {
    _justifyContent = KlJustifyContent.from(value) ?? _justifyContent;
    element.style.justifyContent = _justifyContent?.toStyle();
  }

  @Input()
  set flexDirection(value) {
    _flexDirection = KlFlexDirection.from(value) ?? _flexDirection;
    element.style.flexDirection = _flexDirection?.toStyle();
  }

  @Input()
  set reverse(bool value) {
    if (value == true) {
      element.style.flexDirection = (_flexDirection == KlFlexDirection.row
              ? KlFlexDirection.rowReverse
              : _flexDirection == KlFlexDirection.rowReverse
                  ? KlFlexDirection.row
                  : _flexDirection == KlFlexDirection.column
                      ? KlFlexDirection.columnReverse
                      : _flexDirection == KlFlexDirection.columnReverse
                          ? KlFlexDirection.column
                          : KlFlexDirection.unset)
          .toStyle();
    } else {
      element.style.flexDirection = _flexDirection?.toStyle();
    }
  }

  KlContainer(ElementRef elementRef) : super(elementRef) {
    display = KlDisplay.flex;
  }
}
