import "package:mockup/src/data/automobile_data.dart";
import "package:mockup/src/model/automobile_model.dart";
import "package:mockup/src/utils/extension.dart";
import "../base/base_provider.dart";

/// Provider for automobile mock data.
///
/// This class implements the [IBaseProvider] interface for [AutomobileModel] objects
/// and manages access to a collection of automobile data. It follows the singleton pattern
/// to ensure a single instance is used throughout the application.
class AutomobileProvider implements IBaseProvider<AutomobileModel> {
  /// Internal cache of automobile data items.
  List<AutomobileModel> _cachedList = [];

  /// Private constructor that initializes the data cache.
  AutomobileProvider._() {
    _init();
  }

  /// Singleton instance of the [AutomobileProvider].
  static final AutomobileProvider _instance = AutomobileProvider._();

  /// Provides access to the singleton instance of [AutomobileProvider].
  static AutomobileProvider get instance => _instance;

  /// Initializes the internal cache with automobile data from the predefined JSON.
  void _init() async {
    if (_cachedList.isEmpty) {
      const List<dynamic> jsonList = AutomobileData.json;
      _cachedList = jsonList.map((e) => AutomobileModel.fromJson(e)).toList();
    }
  }

  /// Returns the automobile at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always returned.
  @override
  AutomobileModel getItemAt(int index) {
    return _cachedList[index % _cachedList.length];
  }

  /// Returns a shuffled copy of all automobile data.
  ///
  /// The original data remains unchanged.
  @override
  List<AutomobileModel> getShuffledList() {
    final randomList = <AutomobileModel>[..._cachedList];
    randomList.shuffle();
    return randomList;
  }

  /// Returns a random automobile from the available collection.
  @override
  AutomobileModel getRandomItem() {
    return _cachedList.random();
  }

  /// Returns all available automobile data items.
  ///
  /// The returned list contains distinct elements without duplicates.
  @override
  List<AutomobileModel> getAll() {
    return _cachedList;
  }

  /// Returns a list containing [total] automobile data items.
  ///
  /// If [total] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  @override
  List<AutomobileModel> getItems([int total = 1]) {
    return _cachedList.getAppendList(total);
  }
}
