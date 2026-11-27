import "dart:math";

import "../config.dart";
import "../model/mock_page.dart";
import "../model/mockup_exception.dart";
import "../utils/extension.dart";
import "base_provider.dart";
import "json_provider.dart";

/// The shared API of every record category under `Mockup`, such as
/// `Mockup.user` or `Mockup.quote`.
///
/// The bundled dataset is parsed once into an unmodifiable list of [T].
/// On top of it you get:
///
/// * **Synchronous access**: [getAll], [getItems], [getItemAt],
///   [getRandomItem], [getShuffledList] and [rawJson].
/// * **Pagination**: [getPage], returning a [MockPage].
/// * **Simulated network calls**: [fetchAll], [fetchItems],
///   [fetchRandomItem] and [fetchPage], with configurable latency and random
///   failures ([MockupException]).
///
/// ```dart
/// // Synchronous
/// final users = Mockup.user.getItems(30);
///
/// // Like a real backend: 300 ms latency, fails 10% of the time
/// final page = await Mockup.user.fetchPage(
///   1,
///   pageSize: 20,
///   delay: const Duration(milliseconds: 300),
///   failureRate: 0.1,
/// );
/// ```
///
/// Use it as a type to write code that works with any category:
///
/// ```dart
/// Widget buildList<T>(JsonDataProvider<T> source) { ... }
/// ```
abstract class JsonDataProvider<T> implements IBaseProvider<T>, IJsonProvider {
  /// Parses [json] into models using [fromJson].
  JsonDataProvider(
    List<Map<String, dynamic>> json,
    T Function(Map<String, dynamic>) fromJson,
  )   : _json = json,
        _items = List.unmodifiable(json.map(fromJson));

  final List<Map<String, dynamic>> _json;
  final List<T> _items;

  // ---------------------------------------------------------------------------
  // Synchronous access
  // ---------------------------------------------------------------------------

  /// Returns all available items.
  ///
  /// The returned list is unmodifiable and contains distinct elements
  /// without duplicates. Copy it (e.g. with `toList()`) if you need to
  /// modify it.
  @override
  List<T> getAll() => _items;

  /// Returns the item at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always
  /// returned.
  @override
  T getItemAt(int index) => _items[index % _items.length];

  /// Returns a list containing [count] items.
  ///
  /// If [count] exceeds the number of unique items available, the list cycles
  /// back to the start, so it may contain duplicates. Throws a [RangeError] if
  /// [count] is negative.
  @override
  List<T> getItems([int count = 1]) => _items.getAppendList(count);

  /// Returns a random item from the collection.
  @override
  T getRandomItem() => _items.random();

  /// Returns a shuffled, modifiable copy of all items.
  ///
  /// The original data remains unchanged.
  @override
  List<T> getShuffledList() => <T>[..._items]..shuffle(mockupRandom);

  /// The raw JSON entries this provider was built from, useful for mocking
  /// API responses.
  @override
  List<Map<String, dynamic>> get rawJson => _json;

  /// Returns page number [page] (1-based) of [pageSize] items.
  ///
  /// By default the data set has as many items as [getAll]. Pass
  /// [totalItems] to simulate a larger (or smaller) collection; items then
  /// cycle the same way as in [getItems]. Pages past the end are empty.
  ///
  /// ```dart
  /// final page = Mockup.user.getPage(1, pageSize: 10, totalItems: 95);
  /// page.items.length; // 10
  /// page.totalPages;   // 10
  /// page.hasNextPage;  // true
  /// ```
  MockPage<T> getPage(int page, {int pageSize = 20, int? totalItems}) {
    if (page < 1) throw RangeError.range(page, 1, null, "page");
    if (pageSize < 1) throw RangeError.range(pageSize, 1, null, "pageSize");
    final total = totalItems ?? _items.length;
    RangeError.checkNotNegative(total, "totalItems");

    final start = (page - 1) * pageSize;
    final end = min(start + pageSize, total);
    final items = start >= total
        ? const <Never>[]
        : List<T>.unmodifiable(
            List.generate(end - start, (i) => getItemAt(start + i)),
          );
    return MockPage<T>(
      items: items,
      page: page,
      pageSize: pageSize,
      totalItems: total,
    );
  }

  // ---------------------------------------------------------------------------
  // Simulated network calls
  // ---------------------------------------------------------------------------

  /// Like [getAll], but completes after [delay] to simulate a network call.
  ///
  /// [delay] defaults to `Mockup.defaultDelay`. With probability
  /// [failureRate] (0.0–1.0) the future fails with a [MockupException]
  /// instead, so you can exercise error states.
  Future<List<T>> fetchAll({Duration? delay, double failureRate = 0}) =>
      _simulate(getAll, delay, failureRate);

  /// Like [getItems], but asynchronous. See [fetchAll] for [delay] and
  /// [failureRate].
  Future<List<T>> fetchItems(
    int count, {
    Duration? delay,
    double failureRate = 0,
  }) =>
      _simulate(() => getItems(count), delay, failureRate);

  /// Like [getRandomItem], but asynchronous. See [fetchAll] for [delay] and
  /// [failureRate].
  Future<T> fetchRandomItem({Duration? delay, double failureRate = 0}) =>
      _simulate(getRandomItem, delay, failureRate);

  /// Like [getPage], but asynchronous: ideal for infinite-scroll demos.
  /// See [fetchAll] for [delay] and [failureRate].
  Future<MockPage<T>> fetchPage(
    int page, {
    int pageSize = 20,
    int? totalItems,
    Duration? delay,
    double failureRate = 0,
  }) =>
      _simulate(
        () => getPage(page, pageSize: pageSize, totalItems: totalItems),
        delay,
        failureRate,
      );

  Future<R> _simulate<R>(
    R Function() compute,
    Duration? delay,
    double failureRate,
  ) async {
    if (failureRate < 0 || failureRate > 1) {
      throw ArgumentError.value(
          failureRate, "failureRate", "Must be between 0.0 and 1.0");
    }
    await Future<void>.delayed(delay ?? MockupConfig.defaultDelay);
    // Only consume a random number when failures are enabled, so seeded
    // sequences are unaffected by plain fetch calls.
    if (failureRate > 0 && mockupRandom.nextDouble() < failureRate) {
      throw const MockupException();
    }
    return compute();
  }
}
