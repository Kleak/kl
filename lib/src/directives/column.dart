import 'package:angular2/angular2.dart';
import 'package:kl/src/directives/container.dart';
import 'package:meta/meta.dart';

@Directive(
  selector: 'kl-column, [kl-column]',
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
class KlColumn extends KlContainer implements OnInit {
  KlColumn(ElementRef elementRef) : super(elementRef);

  @override
  @mustCallSuper
  void ngOnInit() {
    super.ngOnInit();
  }
}
