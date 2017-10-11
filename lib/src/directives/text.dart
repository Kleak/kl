library kl.directives.text;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/text_style.dart';

@Directive(selector: 'kl-text,[kl-text]')
class KlText extends KlBox {
  static num getTextWidth(KlTextStyle textStyle, String text) {
    final canvas = new CanvasElement();
    final ctx = canvas.context2D;
    ctx.font = "${textStyle.fontSize}px ${textStyle.fontFamily}";
    final metric = ctx.measureText(text);
    return metric.width;
  }

  KlTextStyle _textStyle;

  @Input()
  set textStyle(KlTextStyle value) {
    _textStyle = value ?? _textStyle;
    element.style
      ..fontFamily = _textStyle?.fontFamily
      ..fontSize = '${_textStyle?.fontSize}px'
      ..fontWeight = _textStyle?.fontWeight
      ..color = _textStyle?.color?.toStyle()
      ..textTransform = _textStyle?.textTransform?.toStyle()
      ..textAlign = _textStyle?.textAlign?.toStyle()
      ..textDecoration = _textStyle?.textDecoration?.toStyle();
  }

  KlText(ElementRef elementRef) : super(elementRef);
}
