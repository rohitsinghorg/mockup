import "dart:math";

import "../config.dart";

/// The shared random number generator used by all providers.
///
/// Always read through this getter (never cache it) so that [Mockup.seed]
/// takes effect immediately.
Random get mockupRandom => MockupConfig.random;

///
/// [ListExtended] extension is used to add the additional
/// functionalities in the existing list.
///
/// [random] function will generate a random item [T] of the list
///
/// [getAppendList] function will append the list one after another to give the
/// unlimited data to the users.
///
extension ListExtended<T> on List<T> {
  /// Returns a random element of this list.
  T random() {
    return this[mockupRandom.nextInt(length)];
  }

  /// Returns a list of [max] elements, cycling through this list from the
  /// start when [max] exceeds its length.
  ///
  /// Throws a [RangeError] if [max] is negative.
  List<T> getAppendList([int max = 1]) {
    RangeError.checkNotNegative(max, "count");
    return List.generate(max, (index) => this[index % length]);
  }
}

///
/// [RandomExtended] extension will add additional functionality in the Random
/// class.
///
/// [numberBetween] function will generate a random number between two values,
/// inclusive. Example: numberBetween(5, 9) will generate a random number from
/// 5 to 9.
///
extension RandomExtended on Random {
  /// Returns a random integer between [min] and [max], both inclusive.
  ///
  /// Throws an [ArgumentError] if [min] is greater than [max].
  int numberBetween([int min = 0, int max = 9999]) {
    if (min > max) {
      throw ArgumentError(
          "min ($min) must be less than or equal to max ($max)");
    }
    return nextInt((max - min) + 1) + min;
  }
}

/// Compares two nullable lists element by element.
bool listEquals<T>(List<T>? a, List<T>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null || a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

/// Hash code for a nullable list, consistent with [listEquals].
int listHash<T>(List<T>? list) => list == null ? 0 : Object.hashAll(list);
