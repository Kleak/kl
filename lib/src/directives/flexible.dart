import 'package:angular2/angular2.dart';
import 'package:kl/src/element.dart';

@Directive(
  selector: '[kl-flexible]',
)
class KlFlexible extends KlElement implements OnInit {
  @Input('kl-flexible')
  String flex;

  KlFlexible(ElementRef elementRef) : super(elementRef);

  @override
  void ngOnInit() {
    element.style.flex = flex;
  }
}