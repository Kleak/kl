library kl.element;

import 'dart:html';

class KlElement {
  final Element elementRef;

  KlElement(this.elementRef);

  HtmlElement get element => elementRef;
}
