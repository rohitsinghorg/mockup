import "../utils/extension.dart";

/// Provides utilities for generating random number-based mock data.
///
/// Access it through `Mockup.number` rather than instantiating it. It offers
/// methods to generate random digits, numeric strings in various bases (decimal, binary, octal, hexadecimal), and mock
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
class NumberProvider {
  NumberProvider._();

  /// The singleton instance of [NumberProvider].
  static final NumberProvider instance = NumberProvider._();

  /// Returns a random integer between [from] and [to], inclusive.
  ///
  /// [from] — the lower bound (default: 0)
  /// [to] — the upper bound (default: 99)
  ///
  /// Throws an [ArgumentError] if [from] is greater than [to].
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomDigit(10, 20); // might return 17
  /// ```
  int randomDigit([int from = 0, int to = 99]) {
    return mockupRandom.numberBetween(from, to);
  }

  /// Generates a string containing [length] random decimal digits (0–9).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomDecimalString(5); // "83921"
  /// ```
  String randomDecimalString([int length = 1]) {
    RangeError.checkNotNegative(length, "length");
    return List.generate(length, (_) => randomDigit(0, 9).toString()).join();
  }

  /// Generates a string containing [length] random hexadecimal characters (0–F).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomHexString(4); // "A3B2"
  /// ```
  String randomHexString([int length = 1]) {
    RangeError.checkNotNegative(length, "length");
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
    RangeError.checkNotNegative(length, "length");
    return List.generate(length, (_) => randomDigit(0, 1).toString()).join();
  }

  /// Generates a string of [length] random octal digits (0–7).
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomOctalString(3); // "765"
  /// ```
  String randomOctalString([int length = 1]) {
    RangeError.checkNotNegative(length, "length");
    return List.generate(length, (_) => randomDigit(0, 7).toString()).join();
  }

  /// Generates a random IPv4 address.
  ///
  /// Example:
  /// ```dart
  /// Mockup.number.randomIPv4(); // "192.168.1.101"
  /// ```
  String randomIPv4() {
    return List.generate(4, (_) => mockupRandom.numberBetween(0, 255))
        .join(".");
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
        mockupRandom.nextInt(0x10000).toRadixString(16).padLeft(4, "0");
    return List.generate(8, (_) => group()).join(":");
  }

  /// Returns a random double in the range [min] (inclusive) to [max]
  /// (exclusive).
  ///
  /// Throws an [ArgumentError] if [min] is greater than [max].
  ///
  /// ```dart
  /// Mockup.number.randomDouble(1.5, 2.5); // 2.0318...
  /// ```
  double randomDouble([double min = 0, double max = 1]) {
    if (min > max) {
      throw ArgumentError(
          "min ($min) must be less than or equal to max ($max)");
    }
    return min + mockupRandom.nextDouble() * (max - min);
  }

  /// Returns `true` with the given [probability] (0.0–1.0).
  ///
  /// ```dart
  /// Mockup.number.randomBool();    // true or false, 50/50
  /// Mockup.number.randomBool(0.9); // true 90% of the time
  /// ```
  bool randomBool([double probability = 0.5]) {
    if (probability < 0 || probability > 1) {
      throw ArgumentError.value(
          probability, "probability", "Must be between 0.0 and 1.0");
    }
    return mockupRandom.nextDouble() < probability;
  }

  /// Returns a random price between [min] and [max], rounded to 2 decimals.
  ///
  /// ```dart
  /// Mockup.number.randomPrice(); // 348.27
  /// ```
  double randomPrice({double min = 1, double max = 1000}) {
    return (randomDouble(min, max) * 100).round() / 100;
  }

  /// Returns a random, fully opaque color as an ARGB integer, ready to use
  /// with Flutter's `Color`.
  ///
  /// ```dart
  /// Color(Mockup.number.randomColor());
  /// ```
  int randomColor() => 0xFF000000 | mockupRandom.nextInt(0x1000000);

  /// Returns a random color as a `#RRGGBB` hex string.
  ///
  /// ```dart
  /// Mockup.number.randomHexColor(); // "#3FA2C8"
  /// ```
  String randomHexColor() {
    final rgb = mockupRandom.nextInt(0x1000000);
    return "#${rgb.toRadixString(16).padLeft(6, "0").toUpperCase()}";
  }

  /// Returns a fictional US phone number in the `+1-AAA-555-01XX` format.
  ///
  /// The 555-0100 to 555-0199 range is reserved for fictional use, so these
  /// numbers never belong to a real subscriber.
  ///
  /// ```dart
  /// Mockup.number.randomPhoneNumber(); // "+1-415-555-0142"
  /// ```
  String randomPhoneNumber() {
    final area = mockupRandom.numberBetween(201, 989);
    final line = mockupRandom.nextInt(100).toString().padLeft(2, "0");
    return "+1-$area-555-01$line";
  }
}
