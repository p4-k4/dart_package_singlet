import 'dart:async';
import 'package:macros/macros.dart';

/**
 * A macro that transforms a class into a singleton.
 *
 * This macro will:
 * 1. Add a private constructor.
 * 2. Add a static instance getter.
 *
 * Example usage:
 * ```dart
 * @Singleton
 * class MyService {
 *   // Your implementation
 * }
 * ```
 *
 * This allows for easy access to a single instance of the class throughout the application.
 */
macro class Singleton implements ClassDeclarationsMacro {
  const Singleton();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) async {
    final className = clazz.identifier.name;

    // Add static instance field
    builder.declareInType(
      DeclarationCode.fromString(
        'static final instance = $className._();'
      ),
    );

    // Add private constructor
    builder.declareInType(
      DeclarationCode.fromString(
        '$className._();'
      ),
    );
  }
}

/// An alternative version that allows customizing the instance field name
macro class SingletonNamed implements ClassDeclarationsMacro {
  final String instanceName;
  
  const SingletonNamed([this.instanceName = 'instance']);

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) async {
    final className = clazz.identifier.name;

    // Add static instance field with custom name
    builder.declareInType(
      DeclarationCode.fromString(
        'static final $instanceName = $className._();'
      ),
    );

    // Add private constructor
    builder.declareInType(
      DeclarationCode.fromString(
        '$className._();'
      ),
    );
  }
}
