import 'dart:html';
import 'package:angular2/angular2.dart';

class KlElement {
  final ElementRef elementRef;

  KlElement(this.elementRef);

  HtmlElement get element => elementRef.nativeElement;
}