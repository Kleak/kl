library kl.directives.infinite_scroll;

import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:kl/src/directives/container.dart';

@Directive(selector: 'kl-infinite-scroll, [kl-infinity-scroll]')
class KlInfiniteScroll extends KlContainer implements OnDestroy {
  final StreamController<Null> _scrollEndController = new StreamController();
  StreamSubscription<Event> _scrollSubscription;
  Element _source;
  bool _disabled = false;

  @Input()
  int threshold = 80;

  @Input()
  set disabled(bool d) {
    _disabled = d;
    if (_disabled) {
      _scrollSubscription?.cancel();
    } else {
      _setScrollSubscription();
    }
  }

  @Input()
  set source(Element s) {
    _source = s;
    _setScrollSubscription();
  }

  KlInfiniteScroll(ElementRef elementRef) : super(elementRef) {
    _scrollSubscription = window.onScroll.listen(_onScroll);
  }

  @Output('scrollEnd')
  Stream<Null> get onScrollEnd => _scrollEndController.stream;

  @override
  void ngOnDestroy() {
    _scrollEndController?.close();
    _scrollSubscription?.cancel();
  }

  void _onScroll(Event event) {
    if (!_disabled) {
      final alreadyScrolled = _alreadyScrolled();
      if (alreadyScrolled > threshold) {
        _scrollEndController.add(null);
      }
    }
  }

  void _setScrollSubscription() {
    _scrollSubscription?.cancel();
    if (_source == null) {
      _scrollSubscription = window.onScroll.listen(_onScroll);
    } else {
      _scrollSubscription = _source.onScroll.listen(_onScroll);
    }
  }

  num _alreadyScrolled() {
    if (_source == null) {
      return ((window.scrollY + document.body.clientHeight) * 100) /
          document.documentElement.scrollHeight;
    } else {
      return (_source.scrollTop * 100) / _source.scrollHeight;
    }
  }
}
