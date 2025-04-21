import "package:mockup/src/data/building_data.dart";
import "package:mockup/src/utils/extension.dart";
import "../base/base_provider.dart";
import "../model/building_model.dart";

/// Provider for building mock data.
///
/// This class implements the [IBaseProvider] interface for [BuildingModel] objects
/// and manages access to a collection of building data. It follows the singleton pattern
/// to ensure a single instance is used throughout the application.
class BuildingProvider implements IBaseProvider<BuildingModel> {
  /// Internal cache of building data items.
  List<BuildingModel> _cachedList = [];

  /// Private constructor that initializes the data cache.
  BuildingProvider._() {
    _init();
  }

  /// Singleton instance of the [BuildingProvider].
  static final BuildingProvider _instance = BuildingProvider._();

  /// Provides access to the singleton instance of [BuildingProvider].
  static BuildingProvider get instance => _instance;

  /// Initializes the internal cache with building data from the predefined JSON.
  void _init() async {
    if (_cachedList.isEmpty) {
      const List<dynamic> jsonList = BuildingData.json;
      _cachedList = jsonList.map((e) => BuildingModel.fromJson(e)).toList();
    }
  }

  /// Returns the building at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always returned.
  @override
  BuildingModel getItemAt(int index) {
    return _cachedList[index % _cachedList.length];
  }

  /// Returns a shuffled copy of all building data.
  ///
  /// The original data remains unchanged.
  @override
  List<BuildingModel> getShuffledList() {
    final randomList = <BuildingModel>[..._cachedList];
    randomList.shuffle();
    return randomList;
  }

  /// Returns a random building from the available collection.
  @override
  BuildingModel getRandomItem() {
    return _cachedList.random();
  }

  /// Returns all available building data items.
  ///
  /// The returned list contains distinct elements without duplicates.
  @override
  List<BuildingModel> getAll() {
    return _cachedList;
  }

  /// Returns a list containing [total] building data items.
  ///
  /// If [total] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  @override
  List<BuildingModel> getItems([int total = 1]) {
    return _cachedList.getAppendList(total);
  }
}
