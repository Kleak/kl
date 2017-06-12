@Tags(const ['aot'])
@TestOn('browser')

import 'package:angular2/angular2.dart';
import 'package:test/test.dart';

@AngularEntrypoint()
void main() {
  test('test', () {
    expect(true , true);
  });
}