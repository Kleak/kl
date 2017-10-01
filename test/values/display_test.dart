library kl.display.test;

import 'package:test/test.dart';
import 'package:kl/src/display.dart';
import 'package:kl/src/exception.dart';

main() {
  group('$KlDisplay', () {
    group('toStyle', () {
      test('block', () {
        expect(KlDisplay.block.toStyle(), equals('block'));
      });

      test('flex', () {
        expect(KlDisplay.flex.toStyle(), equals('flex'));
      });

      test('unset', () {
        expect(KlDisplay.unset.toStyle(), equals('unset'));
      });

      test('fixed', () {
        expect(KlDisplay.fixed.toStyle(), equals('fixed'));
      });
    });

    test('toString', () {
      expect(KlDisplay.fixed.toString(), equals(KlDisplay.fixed.toStyle()));
    });

    group('fromString', () {
      test('block', () {
        final display = KlDisplay.fromString('block');
        expect(display.toStyle(), equals('block'));
      });

      test('flex', () {
        final display = KlDisplay.fromString('flex');
        expect(display.toStyle(), equals('flex'));
      });

      test('unset', () {
        final display = KlDisplay.fromString('unset');
        expect(display.toStyle(), equals('unset'));
      });

      test('fixed', () {
        final display = KlDisplay.fromString('fixed');
        expect(display.toStyle(), equals('fixed'));
      });

      test('foobar', () {
        final display = KlDisplay.fromString('foobar');
        expect(display.toStyle(), equals('block'));
      });

      test('null', () {
        final display = KlDisplay.fromString(null);
        expect(display, isNull);
      });
    });

    group('from', () {
      test('String', () {
        final display = KlDisplay.from('fixed');
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
      });
    });
  });
}
