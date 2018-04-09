library kl.directives.column;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:kl/src/direction.dart';
import 'package:kl/src/directives/container.dart';

@Directive(selector: 'kl-column, [kl-column]')
class KlColumn extends KlContainer {
  KlColumn(Element elementRef) : super(elementRef) {
    flexDirection = KlFlexDirection.column;
  }
}
