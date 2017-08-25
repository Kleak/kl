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

  @Input('threshold')
  int threshold = 80;

  @Input('fireEvent')
  bool fireEvent = true;

  KlInfiniteScroll(ElementRef elementRef) : super(elementRef);

  @Output('scrollEnd')
  Stream<Null> get onScrollEnd => _fireScrollEnd.stream;

  @override
  void ngOnInit() {
    super.ngOnInit();
    _scrollSubscription = window.onScroll.listen(_onScroll);
  }

  @override
  void ngOnDestroy() {
    _fireScrollEnd?.close();
    _scrollSubscription?.cancel();
  }

  void _onScroll(Event event) {
    if (fireEvent) {
      final alreadyScrolled =
          ((window.scrollY + document.body.clientHeight) * 100) /
              document.documentElement.scrollHeight;
      if (alreadyScrolled > threshold) {
        _fireScrollEnd.add(null);
      }
    }
  }
}
