library kl.directives.infinite_scroll;

import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import "package:rxdart/transformers.dart";

@Directive(selector: 'kl-infinite-scroll, [kl-infinite-scroll]')
class KlInfiniteScroll implements OnDestroy {
  final _scrollEndController = new StreamController<Event>();
  StreamSubscription<Event> _scrollSubscription;
  Element _source;
  bool _disabled = false;
  int _threshold = 100;

  @Input("threshold")
  void set threshold(value) {
    if (value is int) {
      _threshold = value;
    } else if (value is String) {
      _threshold = int.parse(value);
    }
  }

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

  KlInfiniteScroll(ElementRef elementRef) {
    _scrollSubscription = window.onScroll
        .transform(
            new ThrottleStreamTransformer(const Duration(milliseconds: 300)))
        .listen(_onScroll);
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
      final beforeEnd = _calculBeforeEnd();
      if (beforeEnd < _threshold) {
        _scrollEndController.add(event);
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

  int _calculBeforeEnd() {
    final target = _source ?? document.documentElement;
    return target.scrollHeight - (target.scrollTop + target.clientHeight);
  }
}
