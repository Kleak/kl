library kl.directives.column;

import 'package:angular/angular.dart';
import 'package:kl/src/direction.dart';
import 'package:kl/src/directives/container.dart';
import 'package:meta/meta.dart';

@Directive(selector: 'kl-column, [kl-column]')
class KlColumn extends KlContainer {
  KlColumn(ElementRef elementRef) : super(elementRef) {
    flexDirection = KlFlexDirection.column;
  }
}
