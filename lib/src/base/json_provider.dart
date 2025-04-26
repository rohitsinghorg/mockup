/// Json interface for all mock data providers.
///
/// Defines the standard methods that all data providers must implement
/// to ensure consistent access to mock data in JSON format.
abstract interface class IJsonProvider {
  /// Returns all available mock data items in raw JSON format.
  ///
  /// Each item is represented as a map of key-value pairs.
  List<Map<String, dynamic>> get rawJson;
}
