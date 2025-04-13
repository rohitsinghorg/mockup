import 'package:mockup/src/data/flower_data.dart';
import 'package:mockup/src/utils/extension.dart';

import '../base/base_provider.dart';
import '../model/flower_model.dart';

/// Provider for flower mock data.
///
/// This class implements the [IBaseProvider] interface for [FlowerModel] objects
/// and manages access to a collection of flower data. It follows the singleton pattern
/// to ensure a single instance is used throughout the application.
class FlowerProvider implements IBaseProvider<FlowerModel> {
  /// Internal cache of flower data items.
  List<FlowerModel> _cachedList = [];

  /// Private constructor that initializes the data cache.
  FlowerProvider._() {
    _init();
  }

  /// Singleton instance of the [FlowerProvider].
  static final FlowerProvider _instance = FlowerProvider._();

  /// Provides access to the singleton instance of [FlowerProvider].
  static FlowerProvider get instance => _instance;

  /// Initializes the internal cache with flower data from the predefined JSON.
  void _init() async {
    if (_cachedList.isEmpty) {
      const List<dynamic> jsonList = FlowerData.json;
      _cachedList = jsonList.map((e) => FlowerModel.fromJson(e)).toList();
    }
  }

  /// Returns the flower at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always returned.
  @override
  FlowerModel getItemAt(int index) {
    return _cachedList[index % _cachedList.length];
  }

  /// Returns a shuffled copy of all flower data.
  ///
  /// The original data remains unchanged.
  @override
  List<FlowerModel> getShuffledList() {
    final randomList = <FlowerModel>[..._cachedList];
    randomList.shuffle();
    return randomList;
  }

  /// Returns a random flower from the available collection.
  @override
  FlowerModel getRandomItem() {
    return _cachedList.random();
  }

  /// Returns all available flower data items.
  ///
  /// The returned list contains distinct elements without duplicates.
  @override
  List<FlowerModel> getAll() {
    return _cachedList;
  }

  /// Returns a list containing [total] flower data items.
  ///
  /// If [total] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  @override
  List<FlowerModel> getItems([int total = 1]) {
    return _cachedList.getAppendList(total);
  }
}
