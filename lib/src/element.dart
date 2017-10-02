library kl.element;

import 'dart:html';
import 'package:angular/angular.dart';

class KlElement {
  final ElementRef elementRef;

  KlElement(this.elementRef);

  HtmlElement get element => elementRef.nativeElement;
}
