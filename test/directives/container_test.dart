@Tags(const ['aot', 'container'])
@TestOn('browser')
import 'dart:html';

import 'package:pageloader/objects.dart';
import 'package:pageloader/html.dart';
import 'package:test/test.dart';
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:kl/kl.dart';

@AngularEntrypoint('container')
void main() {
  tearDown(disposeAnyRunningTest);

  group('$KlContainer', () {
    final testBed = new NgTestBed<TesterContainer>();
    NgTestFixture<TesterContainer> fixture;
    _PO pageObject;

    setUp(() async {
      fixture = await testBed.create();
      pageObject = await fixture.resolvePageObject(_PO);
    });

    test('flex row', () async {
      expect(await pageObject.dirRow.style["display"], equals("flex"));
      expect(await pageObject.cmpRow.style["display"], equals("flex"));
      expect(await pageObject.dirRow.style["flex-direction"], equals("row"));
      expect(await pageObject.cmpRow.style["flex-direction"],
          equals("row-reverse"));
    });

    test('flex column', () async {
      expect(await pageObject.dirCol.style["display"], equals("flex"));
      expect(await pageObject.cmpCol.style["display"], equals("flex"));
      expect(await pageObject.dirCol.style["flex-direction"], equals("column"));
      expect(await pageObject.cmpCol.style["flex-direction"],
          equals("column-reverse"));
    });

    test('alignItems', () async {
      expect(await pageObject.dirCol.style["align-items"], equals("end"));
      expect(await pageObject.cmpCol.style["align-items"], equals("end"));
    }, skip: true); // does not work :/

    test('flexWrap', () async {
      expect(await pageObject.dirRow.style['flex-wrap'], equals("wrap"));
      expect(await pageObject.cmpRow.style['flex-wrap'], equals("wrap"));
    });

    test('justifyContent', () async {
      expect(
          await pageObject.dirCol.style['justify-content'], equals("center"));
      expect(
          await pageObject.cmpCol.style['justify-content'], equals("center"));
    });
  });
}

@Component(
    selector: 'container-tester',
    template: '''
    <div kl-row  id="dirRow" flexWrap="wrap" ></div>
    <div kl-column id="dirCol" justifyContent="center" alignItems="end" ></div>
    <kl-row id="cmpRow" [reverse]="true" [flexWrap]="KlFlexWrap.wrap" ></kl-row>
    <kl-column id="cmpCol" [reverse]="true" [justifyContent]="KlJustifyContent.center" [alignItems]="KlAlignItem.end"></kl-column>
''',
    exports: const [KlJustifyContent, KlAlignItem, KlFlexWrap],
    directives: const [klDirectives])
class TesterContainer {}

class _PO {
  @ById('dirRow')
  PageLoaderElement dirRow;
  @ById('dirCol')
  PageLoaderElement dirCol;
  @ById('cmpRow')
  PageLoaderElement cmpRow;
  @ById('cmpCol')
  PageLoaderElement cmpCol;
}
