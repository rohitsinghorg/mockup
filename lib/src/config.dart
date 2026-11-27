import "dart:math";

/// Global, mutable settings shared by every provider.
///
/// Exposed to users through [Mockup.seed] and [Mockup.defaultDelay]; kept in
/// its own library so providers can read it without importing `mockup.dart`.
abstract final class MockupConfig {
  static Random _random = Random();

  /// The random number generator used by all providers.
  static Random get random => _random;

  /// Re-seeds [random]. A `null` [seed] restores non-deterministic output.
  static void seed(int? seed) {
    _random = seed == null ? Random() : Random(seed);
  }

  /// Default latency used by the simulated network (`fetch*`) methods.
  static Duration defaultDelay = const Duration(milliseconds: 500);
}
