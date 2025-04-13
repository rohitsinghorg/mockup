import 'package:mockup/src/data/user_data.dart';
import 'package:mockup/src/utils/extension.dart';

import '../base/base_provider.dart';
import '../model/user_model.dart';

/// Provider for user mock data.
///
/// This class implements the [IBaseProvider] interface for [UserModel] objects
/// and manages access to a collection of user data. It follows the singleton pattern
/// to ensure a single instance is used throughout the application.
class UserProvider implements IBaseProvider<UserModel> {
  /// Internal cache of user data items.
  List<UserModel> _cachedList = [];

  /// Private constructor that initializes the data cache.
  UserProvider._() {
    _init();
  }

  /// Singleton instance of the [UserProvider].
  static final UserProvider _instance = UserProvider._();

  /// Provides access to the singleton instance of [UserProvider].
  static UserProvider get instance => _instance;

  /// Initializes the internal cache with quote data from the predefined JSON.
  void _init() async {
    if (_cachedList.isEmpty) {
      const List<dynamic> jsonList = UserData.json;
      _cachedList = jsonList.map((e) => UserModel.fromJson(e)).toList();
    }
  }

  /// Returns the user at the specified [index].
  ///
  /// If [index] is out of bounds, it wraps around to ensure a value is always returned.
  @override
  UserModel getItemAt(int index) {
    return _cachedList[index % _cachedList.length];
  }

  /// Returns a shuffled copy of all user data.
  ///
  /// The original data remains unchanged.
  @override
  List<UserModel> getShuffledList() {
    final randomList = <UserModel>[..._cachedList];
    randomList.shuffle();
    return randomList;
  }

  /// Returns a random user from the available collection.
  @override
  UserModel getRandomItem() {
    return _cachedList.random();
  }

  /// Returns all available user data items.
  ///
  /// The returned list contains distinct elements without duplicates.
  @override
  List<UserModel> getAll() {
    return _cachedList;
  }

  /// Returns a list containing [total] user data items.
  ///
  /// If [total] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  @override
  List<UserModel> getItems([int total = 1]) {
    return _cachedList.getAppendList(total);
  }
}
