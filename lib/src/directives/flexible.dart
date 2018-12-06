library kl.directives.flexible;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:kl/src/element.dart';

@Directive(
  selector: 'kl-flexible, [kl-flexible]',
)
class KlFlexible extends KlElement {
  // maintain backwards compatibility
  @Input('kl-flexible')
  set klFlexible(String value) => flex = value;

  @Input()
  set flex(String value) {
    if (value != null) {
      element.style.flex = value;
    }
  }

  @Input()
  set flexBasis(String value) {
    if (value != null) {
      element.style.flexBasis = value;
    }
  }

  @Input()
  set flexShrink(String value) {
    if (value != null) {
      element.style.flexShrink = value;
    }
  }

  @Input()
  set flexGrow(String value) {
    if (value != null) {
      element.style.flexGrow = value;
    }
  }

  KlFlexible(Element elementRef) : super(elementRef);
}
