import 'package:angular2/angular2.dart';
import 'package:kl/src/element.dart';

@Directive(
  selector: '[kl-flexible]',
)
class KlFlexible extends KlElement {
  @Input('kl-flexible')
  set flex(String value) {
    if (value != null) {
      element.style.flex = value;
    }
  }

  KlFlexible(ElementRef elementRef) : super(elementRef);
}