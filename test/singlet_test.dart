import 'package:singlet/singlet.dart';
import 'package:test/test.dart';

@Singleton()
class MySingletonClass {
  // No additional implementation needed for the test
}

void main() {
  group('Singleton Tests', () {
    test('Singleton instance test', () {
      final instance1 = MySingletonClass.instance;
      final instance2 = MySingletonClass.instance;
      expect(instance1, same(instance2));
    });
  });
}
