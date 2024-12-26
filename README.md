# singlet

A Dart package that provides macros to help you avoid feeling like you're wearing the same old code over and over again. This package offers a simple way to create singleton classes, ensuring you always have just one instance when you need it. Because sometimes, one is really all you need.

## Features

- Easily create singleton classes using the `@Singleton` macro.
- Customize the instance field name with the `@SingletonNamed` macro.
- Keeps your codebase DRY by enforcing a single instance pattern where required.

## Getting started

To start using `singlet`, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  singlet: ^latest_version
  macros: ^latest_macros_version
```

Then, run `flutter pub get` or `dart pub get` to install the package.

**Important**: This package uses Dart macros, which are currently an experimental feature. To use this package, you need to enable macros in your project.

1. **Enable Macros in `analysis_options.yaml`**:
   Add the following to your `analysis_options.yaml` file:

   ```yaml
   analyzer:
     enable-experiment:
       - macros
   ```

2. **Run with Macros Enabled**:
   When running your Dart code, you need to pass the `--enable-experiment=macros` flag:

   ```bash
   dart run --enable-experiment=macros your_app.dart
   flutter run --enable-experiment=macros
   ```

## Usage

To create a singleton class, simply annotate your class with `@Singleton()`:

```dart
import 'package:singlet/singlet.dart';

@Singleton()
class MyService {
  void doSomething() {
    print("Doing something unique.");
  }
}

void main() {
  final service1 = MyService.instance;
  final service2 = MyService.instance;
  print(identical(service1, service2)); // Output: true
}
```

If you need to customize the instance name, use `@SingletonNamed()`:

```dart
import 'package:singlet/singlet.dart';

@SingletonNamed('uniqueInstance')
class AnotherService {
  void doSomethingElse() {
    print("Doing something else, uniquely.");
  }
}

void main() {
  final service1 = AnotherService.uniqueInstance;
  final service2 = AnotherService.uniqueInstance;
  print(identical(service1, service2)); // Output: true
}
```

## Additional information

For more information or to contribute to the package, please visit the [GitHub repository](https://github.com/p4-k4/dart_package_singlet). If you encounter any issues or have suggestions, feel free to file an issue on the repository.

This package is maintained by Paurini Taketakehikuroa Wiringi.
