import 'package:angular/angular.dart';
import 'package:kl/kl.dart';
import 'package:kl/src/align_item.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/display.dart';
import 'package:kl/src/flex_wrap.dart';
import 'package:meta/meta.dart';

@Directive(
  selector: 'kl-container, [kl-container]',
  inputs: const ['constraint', 'decoration', 'padding', 'margin'],
)
class KlContainer extends KlBox implements OnInit {
  String _direction;
  KlAlignItem _alignItems;
  KlJustifyContent _justifyContent;
  KlFlexWrap _flexWrap;

  @Input('alignItems')
  set alignItems(KlAlignItem value) {
    _alignItems = value ?? _alignItems;
    element.style.alignItems = _alignItems?.toStyle();
  }

  @Input('flexWrap')
  set flexWrap(KlFlexWrap value) {
    _flexWrap = value ?? _flexWrap;
    element.style.flexWrap = _flexWrap?.toStyle();
  }

  @Input('justifyContent')
  set justifyContent(KlJustifyContent value) {
    _justifyContent = value ?? _justifyContent;
    element.style.justifyContent = _justifyContent?.toStyle();
  }

  @Input('direction')
  set direction(String value) {
    _direction = value ?? _direction;
    element.style.flexDirection = _direction;
  }

  KlContainer(ElementRef elementRef) : super(elementRef);

  @override
  @mustCallSuper
  void ngOnInit() {
    display = KlDisplay.flex;
    direction = 'column';
  }
}
