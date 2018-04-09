library kl.directives.image;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:kl/kl.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/object_fit.dart';

@Directive(selector: 'kl-image, [kl-image]')
class KlImage extends KlBox {
  String _src;
  String _defaultImage;
  String _currentSrc;
  KlObjectFit _objectFit;

  @Input()
  set defaultImage(String value) {
    _defaultImage = value ?? _defaultImage;
  }

  @Input('source')
  set src(String value) {
    _src = value ?? _src ?? _defaultImage;
    _updateImg(_src);
  }

  @Input()
  set objectFit(/*String|KlObjectFit*/ value) {
    _objectFit = KlObjectFit.from(value) ?? _objectFit;
    element.style.objectFit = _objectFit?.toStyle();
  }

  KlImage(Element elementRef) : super(elementRef);

  _updateImg(String source) {
    _currentSrc = source;
    if (source != null) {
      if (element is ImageElement) {
        (element as ImageElement).src = source;
      } else {
        element.style.backgroundImage = "url('$source')";
        if (element.style.display.isEmpty) {
          element.style.display = KlDisplay.block.toStyle();
        }
        if (element.style.height.isEmpty) {
          element.style.height == "100%";
        }
      }
    }
  }

  @HostListener('error')
  onLoadImageError() {
    if (_currentSrc != _defaultImage && _defaultImage != null) {
      _updateImg(_defaultImage);
    }
  }
}
