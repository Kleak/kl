import 'package:angular2/angular2.dart';
import 'package:kl/src/constraint.dart';
import 'package:kl/src/decoration.dart';
import 'package:kl/src/display.dart';
import 'package:kl/src/edge_insets.dart';
import 'package:kl/src/element.dart';

@Directive(selector: 'kl-box')
class KlBox extends KlElement {
  KlConstraint _constraint;
  KlDecoration _decoration;
  KlEdgeInsets _padding;
  KlEdgeInsets _margin;
  KlDisplay _display;

  @Input('display')
  set display(KlDisplay value) {
    _display = value ?? _display;
    element.style.display = _display?.toStyle();
  }

  @Input('constraint')
  set constraint(KlConstraint value) {
    _constraint = value ?? _constraint;
    element.style
      ..width = _constraint?.width
      ..height = _constraint?.height
      ..minWidth = _constraint?.minWidth
      ..minHeight = _constraint?.minHeight
      ..maxWidth = _constraint?.maxWidth
      ..maxHeight = _constraint?.maxHeight;
  }

  @Input('decoration')
  set decoration(KlDecoration value) {
    _decoration = value ?? _decoration;
    element.style
      ..borderRadius =
          _decoration == null ? 'none' : '${_decoration?.borderRadius}px'
      ..backgroundColor = _decoration?.backgroundColor?.toStyle()
      ..borderTop = _decoration?.border?.top?.toStyle()
      ..borderRight = _decoration?.border?.right?.toStyle()
      ..borderBottom = _decoration?.border?.bottom?.toStyle()
      ..borderLeft = _decoration?.border?.left?.toStyle();
  }

  @Input('padding')
  set padding(KlEdgeInsets value) {
    _padding = value ?? _padding;
    element.style.padding = _padding?.toStyle();
  }

  @Input('margin')
  set margin(KlEdgeInsets value) {
    _margin = value ?? _margin;
    element.style.margin = _margin?.toStyle();
  }

  KlBox(ElementRef elementRef) : super(elementRef);
}
