import 'package:angular2/angular2.dart';
import 'package:angular2/security.dart';
import 'package:kl/src/directives/box.dart';
import 'package:kl/src/icon.dart';

@Component(
  selector: 'al-icon',
  templateUrl: 'icon.html',
  styleUrls: const ['icon.css'],
  directives: const <dynamic>[COMMON_DIRECTIVES, SafeInnerHtmlDirective],
  inputs: const ['display', 'constraint', 'decoration', 'padding', 'margin'],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class KlIcon extends KlBox implements OnInit {
  final ChangeDetectorRef _changeDetectorRef;
  final DomSanitizationService _domSecurityService;

  @Input('icon')
  Icon icon;

  @Input('fill')
  String fill = 'white';

  SafeHtml html;

  KlIcon(
      ElementRef elementRef, this._changeDetectorRef, this._domSecurityService)
      : super(elementRef);

  void ngOnInit() {
    if (icon != null) {
      html = _domSecurityService.bypassSecurityTrustHtml(icon.data);
      _changeDetectorRef.markForCheck();
    }
  }
}
