import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/display.dart';
import 'package:kl/src/text_style.dart';

@Directive(
  selector: 'kl-text,[kl-text]',
  inputs: const ['constraint', 'decoration', 'padding', 'margin'],
)
class KlText extends KlBox implements OnInit {
  static double getTextWidth(KlTextStyle textStyle, String text) {
    final canvas = new CanvasElement();
    final ctx = canvas.context2D;
    ctx.font = "${textStyle.fontSize}px ${textStyle.fontFamily}";
    final metric = ctx.measureText(text);
    return metric.width;

  }

  KlTextStyle _textStyle;

  @Input('textStyle')
  set textStyle(KlTextStyle value) {
    _textStyle = value ?? _textStyle;
    element.style
      ..fontFamily = _textStyle?.fontFamily
      ..fontSize = '${_textStyle?.fontSize}px'
      ..color = _textStyle?.color?.toStyle()
      ..textTransform = _textStyle?.textTransform?.toStyle();
  }

  KlText(ElementRef elementRef) : super(elementRef);

  @override
  void ngOnInit() {
    display = KlDisplay.block;
  }
}
