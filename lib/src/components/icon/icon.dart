import 'package:angular2/angular2.dart';
import 'package:angular2/security.dart';
import 'package:kl/src/align_item.dart';
import 'package:kl/src/color.dart';
import 'package:kl/src/directives/row.dart';
import 'package:kl/src/icon.dart';
import 'package:kl/src/justify_content.dart';

@Component(
  selector: 'kl-icon',
  templateUrl: 'icon.html',
  styleUrls: const ['icon.css'],
  directives: const <dynamic>[COMMON_DIRECTIVES, SafeInnerHtmlDirective],
  inputs: const [
    'display',
    'constraint',
    'decoration',
    'padding',
    'margin',
    'alignItems',
    'justifyContent',
    'flexWrap'
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class KlIcon extends KlRow implements OnInit {
  final ChangeDetectorRef _changeDetectorRef;
  final DomSanitizationService _domSecurityService;

  @Input('icon')
  Icon icon;

  @Input('fill')
  KlColor fill;

  SafeHtml html;

  KlIcon(
      ElementRef elementRef, this._changeDetectorRef, this._domSecurityService)
      : super(elementRef) {
    alignItems = KlAlignItem.center;
    justifyContent = KlJustifyContent.center;
  }

  @override
  void ngOnInit() {
    super.ngOnInit();
    if (icon != null) {
      html = _domSecurityService.bypassSecurityTrustHtml(icon.data);
      _changeDetectorRef.markForCheck();
    }
  }
}
