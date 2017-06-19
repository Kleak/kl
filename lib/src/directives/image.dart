import 'dart:async';
import 'dart:convert';
import 'package:angular2/angular2.dart';
import 'package:kl/src/directives/box.dart';
import 'package:http/browser_client.dart' as http;
import 'package:http/http.dart' as http;
import 'package:kl/src/object_fit.dart';

@Directive(
  selector: '[kl-image]',
  inputs: const ['constraint', 'decoration', 'padding', 'margin'],
)
class KlImage extends KlBox implements OnDestroy {
  http.BrowserClient _client;
  StreamController<Null> _onLoadFinish;
  String _src;
  KlObjectFit _objectFit;
  String _defaultImageData;

  @Input('defaultImage')
  set defaultImage(String value) {
    _defaultImageData = value ?? _defaultImageData;
    if (_defaultImageData != null) {
      _updatSrc(_defaultImageData);
    }
  }

  @Input('source')
  set src(String value) {
    _src = value ?? _src;
    if (_src != null) {
      _updateSource();
    }
  }

  @Input('objectFit')
  set position(KlObjectFit value) {
    _objectFit = value ?? _objectFit;
    element.style.objectFit = _objectFit?.toStyle();
  }

  KlImage(ElementRef elementRef) : super(elementRef) {
    _onLoadFinish = new StreamController();
    _client = new http.BrowserClient();
  }

  @Output('loadFinish')
  Stream<Null> get onLoadFinish => _onLoadFinish.stream;

  @override
  void ngOnDestroy() {
    _onLoadFinish.close();
  }

  Future<Null> _updateSource() async {
    final response = await _client.get(_src);
    String data;
    switch (response.headers['content-type']) {
      case 'image/svg+xml':
        data =
            "data:image/svg+xml;base64,";
        break;
      case 'image/png':
        data = "data:image/png;base64,";
        break;
      case 'image/jpeg':
        data = 'data:image/jpeg;base64,';
        break;
      case 'image/webp':
        data = 'data:image/webp;base64,';
        break;
    }
    data += _bytesToBase64(response.bodyBytes);
    _onLoadFinish.add(null);
    _updatSrc(data);
  }

  void _updatSrc(String data) {
    element.setAttribute('src', data);
  }

  String _bytesToBase64(List<int> bytes) => BASE64.encode(bytes);
}
