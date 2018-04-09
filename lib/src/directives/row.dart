library kl.directives.row;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:kl/src/direction.dart';
import 'package:kl/src/directives/container.dart';

@Directive(selector: 'kl-row, [kl-row]')
class KlRow extends KlContainer {
  KlRow(Element elementRef) : super(elementRef) {
    flexDirection = KlFlexDirection.row;
  }
}
