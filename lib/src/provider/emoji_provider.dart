import 'package:mockup/src/data/emoji_data.dart';
import 'package:mockup/src/utils/extension.dart';

import '../base/base_provider.dart';
import '../model/emoji_model.dart';

/// Provider for emoji mock data.
///
/// This class implements the [IBaseProvider] interface for [EmojiModel] objects
/// and manages access to a collection of emoji data. It follows the singleton pattern
/// to ensure a single instance is used throughout the application.
class EmojiProvider implements IBaseProvider<EmojiModel> {
  /// Internal cache of emoji data items.
  List<EmojiModel> _cachedList = [];

  /// Private constructor that initializes the data cache.
  EmojiProvider._() {
    _init();
  }

  /// Singleton instance of the [EmojiProvider].
  static final EmojiProvider _instance = EmojiProvider._();

  /// Provides access to the singleton instance of [EmojiProvider].
  static EmojiProvider get instance => _instance;

  /// Initializes the internal cache with emoji data from the predefined JSON.
  void _init() async {
    if (_cachedList.isEmpty) {
      const List<dynamic> jsonList = EmojiData.json;
      _cachedList = jsonList.map((e) => EmojiModel.fromJson(e)).toList();
    }
  }

  /// Returns the emoji at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always returned.
  @override
  EmojiModel getItemAt(int index) {
    return _cachedList[index % _cachedList.length];
  }

  /// Returns a shuffled copy of all emoji data.
  ///
  /// The original data remains unchanged.
  @override
  List<EmojiModel> getShuffledList() {
    final randomList = <EmojiModel>[..._cachedList];
    randomList.shuffle();
    return randomList;
  }

  /// Returns a random emoji from the available collection.
  @override
  EmojiModel getRandomItem() {
    return _cachedList.random();
  }

  /// Returns all available emoji data items.
  ///
  /// The returned list contains distinct elements without duplicates.
  @override
  List<EmojiModel> getAll() {
    return _cachedList;
  }

  /// Returns a list containing [total] emoji data items.
  ///
  /// If [total] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  @override
  List<EmojiModel> getItems([int total = 1]) {
    return _cachedList.getAppendList(total);
  }
}