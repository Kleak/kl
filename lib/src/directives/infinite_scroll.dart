import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:kl/src/directives/container.dart';

@Directive(
  selector: 'kl-infinite-scroll',
  inputs: const [
    'alignItems',
    'flexWrap',
    'justifyContent',
    'direction',
    'constraint',
    'decoration',
    'padding',
    'margin',
  ],
)
class KlInfiniteScroll extends KlContainer implements OnInit, OnDestroy {
  final StreamController<Null> _fireScrollEnd = new StreamController();
  StreamSubscription<Event> _scrollSubscription;
  Element _source;

  @Input('threshold')
  int threshold = 80;

  @Input('disabled')
  bool disabled = false;

  @Input('source')
  set source(Element s) {
    _source = s;
    _scrollSubscription?.cancel();
    if (s == null) {
      _scrollSubscription = window.onScroll.listen(_onScroll);
    } else {
      _scrollSubscription = s.onScroll.listen(_onScroll);
    }
  }

  KlInfiniteScroll(ElementRef elementRef) : super(elementRef) {
    window.onScroll.listen(_onScroll);
  }

  @Output('scrollEnd')
  Stream<Null> get onScrollEnd => _fireScrollEnd.stream;

  @override
  void ngOnInit() {
    super.ngOnInit();
  }

  @override
  void ngOnDestroy() {
    _fireScrollEnd?.close();
    _scrollSubscription?.cancel();
  }

  void _onScroll(Event event) {
    if (!disabled) {
      final alreadyScrolled = _alreadyScrolled();
      if (alreadyScrolled > threshold) {
        _fireScrollEnd.add(null);
      }
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
