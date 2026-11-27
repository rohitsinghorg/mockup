/// The error thrown by the simulated network (`fetch*`) methods when a
/// failure is triggered through their `failureRate` parameter.
///
/// Catch it to exercise error states in your UI:
///
/// ```dart
/// try {
///   await Mockup.user.fetchItems(10, failureRate: 0.3);
/// } on MockupException catch (e) {
///   showError(e.message);
/// }
/// ```
class MockupException implements Exception {
  /// Creates an exception with the given [message].
  const MockupException([this.message = "Simulated network error"]);

  /// A human-readable description of the failure.
  final String message;

  @override
  String toString() => "MockupException: $message";
}
