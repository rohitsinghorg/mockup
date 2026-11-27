import "../utils/extension.dart";

/// Provider for random dates, accessed through `Mockup.date`.
///
/// Methods that are relative to "now" accept a `from` date so results can be
/// made fully reproducible together with `Mockup.seed`.
class DateProvider {
  DateProvider._();

  /// The singleton instance of [DateProvider].
  static final DateProvider instance = DateProvider._();

  /// Returns a random moment between [start] and [end] (inclusive).
  ///
  /// The result is in UTC if [start] is. Throws an [ArgumentError] if
  /// [start] is after [end].
  ///
  /// ```dart
  /// Mockup.date.between(DateTime(2020), DateTime(2021));
  /// ```
  DateTime between(DateTime start, DateTime end) {
    if (start.isAfter(end)) {
      throw ArgumentError("start ($start) must not be after end ($end)");
    }
    final from = start.microsecondsSinceEpoch;
    final span = end.microsecondsSinceEpoch - from;
    final offset = (mockupRandom.nextDouble() * span).floor();
    return DateTime.fromMicrosecondsSinceEpoch(from + offset,
        isUtc: start.isUtc);
  }

  /// Returns a random moment within [within] before [from] (default: now).
  ///
  /// ```dart
  /// Mockup.date.past(); // some time in the last 365 days
  /// Mockup.date.past(within: const Duration(hours: 1));
  /// ```
  DateTime past({
    Duration within = const Duration(days: 365),
    DateTime? from,
  }) {
    final reference = from ?? DateTime.now();
    return between(reference.subtract(within), reference);
  }

  /// Returns a random moment within [within] after [from] (default: now).
  ///
  /// ```dart
  /// Mockup.date.future(within: const Duration(days: 30));
  /// ```
  DateTime future({
    Duration within = const Duration(days: 365),
    DateTime? from,
  }) {
    final reference = from ?? DateTime.now();
    return between(reference, reference.add(within));
  }

  /// Returns a random date of birth (with no time part) for a person aged
  /// between [minAge] and [maxAge] years (inclusive) on [from] (default:
  /// today).
  ///
  /// ```dart
  /// Mockup.date.birthday(minAge: 21, maxAge: 30);
  /// ```
  DateTime birthday({int minAge = 18, int maxAge = 80, DateTime? from}) {
    RangeError.checkNotNegative(minAge, "minAge");
    if (minAge > maxAge) {
      throw ArgumentError(
          "minAge ($minAge) must be less than or equal to maxAge ($maxAge)");
    }
    final ref = from ?? DateTime.now();
    // Born on or before this date => at least minAge.
    final latest = DateTime(ref.year - minAge, ref.month, ref.day);
    // Born after this date => at most maxAge.
    final earliest = DateTime(ref.year - maxAge - 1, ref.month, ref.day + 1);
    final date = between(earliest, latest);
    return DateTime(date.year, date.month, date.day);
  }
}
