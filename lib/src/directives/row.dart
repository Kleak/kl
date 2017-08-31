import 'package:angular/angular.dart';
import 'package:kl/src/directives/container.dart';
import 'package:meta/meta.dart';

@Directive(
  selector: 'kl-row,[kl-row]',
  inputs: const [
    'constraint',
    'decoration',
    'padding',
    'margin',
    'alignItems',
    'justifyContent',
    'flexWrap'
  ],
)
class KlRow extends KlContainer implements OnInit {
  KlRow(ElementRef elementRef) : super(elementRef);

  @override
  @mustCallSuper
  void ngOnInit() {
    super.ngOnInit();
    direction = 'row';
  }
}
