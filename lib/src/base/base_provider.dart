/// Base interface for all mock data providers.
///
/// This interface defines the standard methods that all data providers
/// must implement to ensure consistent data access patterns.
abstract interface class IBaseProvider<T> {
  /// Returns all available mock data items of type [T].
  ///
  /// The returned list contains distinct elements without duplicates.
  List<T> getAll();

  /// Returns a specific mock data item at the given [index].
  ///
  /// If the [index] is greater than the number of available items,
  /// the provider will wrap around and return items from the beginning
  /// of the collection.
  T getItemAt(int index);

  /// Returns a list containing [count] mock data items.
  ///
  /// If [count] exceeds the number of unique items available,
  /// the returned list may contain duplicate items.
  ///
  /// By default, returns a list with a single item.
  List<T> getItems(int count);

  /// Returns a random mock data item from the available collection.
  T getRandomItem();

  /// Returns a randomly shuffled list of all available mock data items.
  ///
  /// The returned list contains the same items as [getAll()], but in a
  /// different, randomized order.
  List<T> getShuffledList();
}
