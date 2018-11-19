library kl.directives.flexible;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:kl/src/element.dart';

@Directive(
  selector: 'kl-flexible, [kl-flexible]',
)
class KlFlexible extends KlElement {
  @Input('kl-flexible')
  set flex(String value) {
    if (value != null) {
      element.style.flex = value;
    }
  }

  KlFlexible(Element elementRef) : super(elementRef);
}
