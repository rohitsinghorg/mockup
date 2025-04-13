import 'dart:math';
import 'package:mockup/src/utils/extension.dart';

/// Provides internal utilities for generating random number-based mock data.
///
/// This class is used by the `Mockup.number` class and should not
/// be accessed directly. It offers methods to generate random digits, numeric
/// strings in various bases (decimal, binary, octal, hexadecimal), and mock
/// IP addresses (IPv4 and IPv6).
///
/// ### Access through:
/// ```dart
/// Mockup.number.randomDigit(0, 50);
/// Mockup.number.randomHexString(4);
/// ```
///
/// ### Features:
/// - Random digits between a given range
/// - Randomly generated number strings in multiple bases
/// - IPv4 and IPv6 address generation
///
/// This class is part of the mock data generation framework and is not intended
/// for public use.
///
class NumberProvider {
  NumberProvider._();

  static final NumberProvider _instance = NumberProvider._();

  static NumberProvider get instance => _instance;

  final Random _random = Random();

  /// Returns a random integer between [from] and [to], inclusive.
  ///
  /// [from] — the lower bound (default: 0)
  /// [to] — the upper bound (default: 99)
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomDigit(10, 20); // might return 17
  /// ```
  int randomDigit([int from = 0, int to = 99]) {
    return _random.numberBetween(from, to);
  }

  /// Generates a string containing [length] random decimal digits (0–9).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomDecimalString(5); // "83921"
  /// ```
  String randomDecimalString([int length = 1]) {
    return List.generate(length, (_) => randomDigit(0, 9).toString()).join();
  }

  /// Generates a string containing [length] random hexadecimal characters (0–F).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomHexString(4); // "A3B2"
  /// ```
  String randomHexString([int length = 1]) {
    return List.generate(
            length, (_) => randomDigit(0, 15).toRadixString(16).toUpperCase())
        .join();
  }

  /// Generates a string of [length] random binary digits (0 or 1).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomBinaryString(8); // "10110010"
  /// ```
  String randomBinaryString([int length = 1]) {
    return List.generate(length, (_) => randomDigit(0, 1).toString()).join();
  }

  /// Generates a string of [length] random octal digits (0–7).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomOctalString(3); // "765"
  /// ```
  String randomOctalString([int length = 1]) {
    return List.generate(length, (_) => randomDigit(0, 7).toString()).join();
  }

  /// Generates a random IPv4 address.
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomIPv4(); // "192.168.1.101"
  /// ```
  String randomIPv4() {
    return List.generate(4, (_) => _random.numberBetween(0, 255)).join('.');
  }

  /// Generates a random IPv6 address.
  ///
  /// Each segment is a 4-digit hexadecimal number (16 bits).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomIPv6(); // "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
  /// ```
  String randomIPv6() {
    String group() =>
        _random.nextInt(0x10000).toRadixString(16).padLeft(4, '0');
    return List.generate(8, (_) => group()).join(':');
  }
}
