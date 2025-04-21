import "package:mockup/src/data/quote_data.dart";
import "package:mockup/src/utils/extension.dart";

import "../base/base_provider.dart";
import "../model/quote_model.dart";

/// Provider for quote mock data.
///
/// This class implements the [IBaseProvider] interface for [QuoteModel] objects
/// and manages access to a collection of quote data. It follows the singleton pattern
/// to ensure a single instance is used throughout the application.
class QuoteProvider implements IBaseProvider<QuoteModel> {
  /// Internal cache of quote data items.
  List<QuoteModel> _cachedList = [];

  /// Private constructor that initializes the data cache.
  QuoteProvider._() {
    _init();
  }

  /// Singleton instance of the [QuoteProvider].
  static final QuoteProvider _instance = QuoteProvider._();

  /// Provides access to the singleton instance of [QuoteProvider].
  static QuoteProvider get instance => _instance;

  /// Initializes the internal cache with quote data from the predefined JSON.
  void _init() async {
    if (_cachedList.isEmpty) {
      const List<dynamic> jsonList = QuoteData.json;
      _cachedList = jsonList.map((e) => QuoteModel.fromJson(e)).toList();
    }
  }

  /// Returns the quote at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always returned.
  @override
  QuoteModel getItemAt(int index) {
    return _cachedList[index % _cachedList.length];
  }

  /// Returns a shuffled copy of all quote data.
  ///
  /// The original data remains unchanged.
  @override
  List<QuoteModel> getShuffledList() {
    final randomList = <QuoteModel>[..._cachedList];
    randomList.shuffle();
    return randomList;
  }

  /// Returns a random quote from the available collection.
  @override
  QuoteModel getRandomItem() {
    return _cachedList.random();
  }

  /// Returns all available quote data items.
  ///
  /// The returned list contains distinct elements without duplicates.
  @override
  List<QuoteModel> getAll() {
    return _cachedList;
  }

  /// Returns a list containing [total] quote data items.
  ///
  /// If [total] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  @override
  List<QuoteModel> getItems([int total = 1]) {
    return _cachedList.getAppendList(total);
  }
}
