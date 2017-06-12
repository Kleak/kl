import 'package:angular2/angular2.dart';
import 'package:kl/kl.dart';
import 'package:kl/src/align_item.dart';
import 'package:kl/src/directives/box.dart';

@Directive(
  selector: 'kl-container, [kl-container]',
  inputs: const ['constraint', 'decoration', 'padding', 'margin'],
)
class KlContainer extends KlBox implements OnInit {
  String _direction = 'column';
  KlAlignItem _alignItems = KlAlignItem.start;
  KlJustifyContent _justifyContent;

  @Input('alignItems')
  set alignItems(KlAlignItem value) {
    _alignItems = value ?? _alignItems;
  }

  @Input('justifyContent')
  set justifyContent(value) {
    _justifyContent = value ?? _justifyContent;
  }

  @Input('direction')
  set direction(String value) {
    _direction = value ?? _direction;
  }

  KlContainer(ElementRef elementRef) : super(elementRef);

  @override
  void ngOnInit() {
    super.ngOnInit();
    element.style
      ..display = 'flex'
      ..flexDirection = _direction
      ..justifyContent = _justifyContent?.toStyle()
      ..alignItems = _alignItems?.toStyle();
  }
}
