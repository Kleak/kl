//@Tags(const ['aot', 'box'])
//@TestOn('browser')
//import 'dart:html';
//
//import 'package:test/test.dart';
//import 'package:angular/angular.dart';
//import 'package:angular_test/angular_test.dart';
//import 'package:kl/kl.dart';
//
//@AngularEntrypoint('box')
//void main() {
//  tearDown(disposeAnyRunningTest);
//
//  group('$KlBox', () {
//    final testBed = new NgTestBed<TesterBox>();
//    NgTestFixture<TesterBox> fixture;
//
//    setUp(() async {
//      fixture = await testBed.create();
//    });
//
//    test('display', () {
//      expect(
//          fixture.assertOnlyInstance.attrDisplay.style.display, equals("flex"));
//      expect(fixture.assertOnlyInstance.ngAttrDisplay.style.display,
//          equals("flex"));
//      expect(
//          fixture.assertOnlyInstance.dirDisplay.style.display, equals("flex"));
//      expect(fixture.assertOnlyInstance.styleDisplay.style.display,
//          equals("flex"));
//    });
//
//    test('constraint', () {
//      expect(fixture.assertOnlyInstance.dirConstraint.style.width,
//          equals("100px"));
//      expect(fixture.assertOnlyInstance.dirConstraint.style.height,
//          equals("150px"));
//
//      expect(fixture.assertOnlyInstance.dirConstraint.style.minWidth,
//          equals("80px"));
//      expect(fixture.assertOnlyInstance.dirConstraint.style.maxWidth,
//          equals("142px"));
//
//      expect(fixture.assertOnlyInstance.dirConstraint.style.minHeight,
//          equals("10px"));
//      expect(fixture.assertOnlyInstance.dirConstraint.style.maxHeight,
//          equals("200px"));
//    });
//
//    test('decoration', () {
//      expect(fixture.assertOnlyInstance.dirDecoration.style.borderRadius,
//          equals("3px"));
//      expect(fixture.assertOnlyInstance.dirDecoration.style.border,
//          equals("2px dashed rgb(255, 238, 255)"));
//      expect(fixture.assertOnlyInstance.dirDecoration.style.backgroundColor,
//          equals("rgb(255, 238, 238)"));
//    });
//
//    test('padding', () {
//      expect(fixture.assertOnlyInstance.dirPadding.style.paddingTop,
//          equals("10px"));
//      expect(fixture.assertOnlyInstance.dirPadding.style.paddingBottom,
//          equals("15px"));
//      expect(fixture.assertOnlyInstance.dirPadding.style.paddingLeft,
//          equals("3px"));
//      expect(fixture.assertOnlyInstance.dirPadding.style.paddingRight,
//          equals("2px"));
//    });
//
//    test('margin', () {
//      expect(
//          fixture.assertOnlyInstance.dirMargin.style.marginTop, equals("10px"));
//      expect(fixture.assertOnlyInstance.dirMargin.style.marginBottom,
//          equals("15px"));
//      expect(
//          fixture.assertOnlyInstance.dirMargin.style.marginLeft, equals("3px"));
//      expect(fixture.assertOnlyInstance.dirMargin.style.marginRight,
//          equals("2px"));
//    });
//  });
//}
//
//@Component(selector: 'box-tester', template: '''
//      <div kl-box #dirDisplay [display]='KlDisplay.flex'></div>
//      <kl-box #ngAttrDisplay [display]='KlDisplay.flex'></kl-box>
//      <kl-box #attrDisplay display='flex'></kl-box>
//      <div #styleDisplay [style.display]="KlDisplay.flex"></div>
//
//      <div kl-box #dirConstraint [constraint]='constraint'></div>
//
//      <div kl-box #dirDecoration [decoration]='decoration'></div>
//
//      <div kl-box #dirPadding [padding]='padding'></div>
//
//      <div kl-box #dirMargin [margin]='margin'></div>
//''', exports: const [KlDisplay], directives: const [KlBox])
//class TesterBox {
//  @ViewChild('attrDisplay')
//  Element attrDisplayRef;
//  @ViewChild('ngAttrDisplay')
//  Element ngAttrDisplayRef;
//  @ViewChild('dirDisplay')
//  Element dirDisplayRef;
//  @ViewChild('styleDisplay')
//  Element styleDisplayRef;
//
//  @ViewChild('dirConstraint')
//  Element dirConstraintRef;
//
//  @ViewChild('dirDecoration')
//  Element dirDecorationRef;
//
//  @ViewChild('dirPadding')
//  Element dirPaddingRef;
//
//  @ViewChild('dirMargin')
//  Element dirMarginRef;
//
//  Element get attrDisplay => attrDisplayRef;
//
//  Element get ngAttrDisplay => ngAttrDisplayRef;
//
//  Element get styleDisplay => styleDisplayRef;
//
//  Element get dirDisplay => dirDisplayRef;
//
//  Element get dirConstraint => dirConstraintRef;
//
//  Element get dirDecoration => dirDecorationRef;
//
//  Element get dirPadding => dirPaddingRef;
//
//  Element get dirMargin => dirMarginRef;
//
//  KlConstraint get constraint => const KlConstraint(
//      width: "100px",
//      height: 150,
//      minHeight: 10,
//      minWidth: "80",
//      maxHeight: "200px",
//      maxWidth: "142");
//
//  KlDecoration get decoration => const KlDecoration(
//      borderRadius: 3,
//      border: const KlBoxBorder.all(const KlBorder(
//          size: 2,
//          style: KlBorderStyle.dashed,
//          color: const KlColor(0xffeeffff))),
//      backgroundColor: const KlColor(0xffeeeeff));
//
//  KlEdgeInsets get padding =>
//      const KlEdgeInsets.only(top: 10, bottom: 15, right: 2, left: 3);
//
//  KlEdgeInsets get margin =>
//      const KlEdgeInsets.only(top: 10, bottom: 15, right: 2, left: 3);
//}
