library kl.text_style.test;

import 'package:kl/src/exception.dart';
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
        test('String', () {
          final align = KlTextAlign.from('center');
          expect(align.toStyle(), equals('center'));
        });

        test('KlTextAlign', () {
          final align = KlTextAlign.from(KlTextAlign.center);
          expect(align.toStyle(), equals('center'));
        });

        test('null', () {
          final align = KlTextAlign.from(null);
          expect(align, isNull);
        });

        test('wrong type', () {
          try {
            KlTextAlign.from(10);
          } catch (e) {
            expect(e is KlTypeValueException, isTrue);
          }
        });
      });
    });
  });
}
