library kl.components.select;

import 'package:angular/angular.dart';
import 'package:kl/src/directives/column.dart';

@Component(
  selector: 'kl-select',
  templateUrl: 'select.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class KlSelect extends KlColumn {
  KlSelect(ElementRef elementRef) : super(elementRef);
}
