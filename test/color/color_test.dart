library kl.color.test;

import 'package:kl/src/color.dart';
import 'package:test/test.dart';

void main() {
  group('KlColor', () {
    test('basic constructor', () {
      final color = new KlColor(0xffffffff);
      expect(color.red, 255);
      expect(color.green, 255);
      expect(color.blue, 255);
      expect(color.alpha, 1);
      expect(color.toStyle(), 'rgba(255, 255, 255, 1.0)');
    });
  });
}
