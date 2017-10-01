library kl.directives.image;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:kl/kl.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/object_fit.dart';

@Directive(selector: 'kl-image, [kl-image]')
class KlImage extends KlBox {
  String _src;
  KlObjectFit _objectFit;
  String _defaultImageData;

  @Input()
  set defaultImage(String value) {
    _defaultImageData = value ?? _defaultImageData;
    _updateImg();
  }

  @Input('source')
  set src(String value) {
    _src = value ?? _src;
    _updateImg();
  }

  @Input()
  set objectFit(/*String|KlObjectFit*/ value) {
    _objectFit = KlObjectFit.from(value) ?? _objectFit;
    element.style.objectFit = _objectFit?.toStyle();
  }

  KlImage(ElementRef elementRef) : super(elementRef);

  _updateImg() {
    final source = _src ?? _defaultImageData;
    if (source != null) {
      if (element is ImageElement) {
        (element as ImageElement).src = source;
      } else {
        element.style.backgroundImage = "url('$source')";
        if (element.style.display.isEmpty) {
          element.style.display = KlDisplay.block.toStyle();
        }
        print("[${element.style.height}]");
        if (element.style.height.isEmpty) {
          element.style.height == "100%";
        }
      }
    }
  }
}
