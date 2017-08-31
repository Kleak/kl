@Tags(const ['aot'])
@TestOn('browser')

import 'package:angular/angular.dart';
import 'package:test/test.dart';

@AngularEntrypoint()
void main() {
  test('test', () {
    expect(true , true);
  });
}