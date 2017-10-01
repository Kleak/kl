library kl.text_style.test;

import 'package:test/test.dart';
import 'package:kl/src/text_style.dart';

main() {
  group('$KlTextStyle', () {
    group('$KlTextAlign', () {
      group('toStyle', () {
        test('left', () {
          expect(KlTextAlign.left.toStyle(), equals('left'));
        });
        test('right', () {
          expect(KlTextAlign.right.toStyle(), equals('right'));
        });
        test('center', () {
          expect(KlTextAlign.center.toStyle(), equals('center'));
        });
      });
      test('toString', () {
        expect(KlTextAlign.center.toString(),
            equals(KlTextAlign.center.toStyle()));
      });
      group('fromString', () {
        test('left', () {
          final align = KlTextAlign.fromString('left');
          expect(align.toStyle(), equals('left'));
        });
        test('right', () {
          final align = KlTextAlign.fromString('right');
          expect(align.toStyle(), equals('right'));
        });
        test('center', () {
          final align = KlTextAlign.fromString('center');
          expect(align.toStyle(), equals('center'));
        });
        test('foobar', () {
          final align = KlTextAlign.fromString('foobar');
          expect(align.toStyle(), equals('left'));
        });

        test('null', () {
          final align = KlTextAlign.fromString(null);
          expect(align, isNull);
        });
      });
      group('from', () {
        /* test('String', () {
          final display = KlTextAlign.from('fixed');
          expect(display.toStyle(), equals('fixed'));
        });

        test('KlDisplay', () {
          final display = KlDisplay.from(KlDisplay.fixed);
          expect(display.toStyle(), equals('fixed'));
        });

        test('null', () {
          final display = KlDisplay.from(null);
          expect(display, isNull);
        });

        test('wrong type', () {
          try {
            KlDisplay.from(10);
          } catch (e) {
            expect(e is KlTypeValueException, isTrue);
            print(e);
          }
        });*/
      });
    });
  });
}
