import "../base/json_data_provider.dart";
import "../data/automobile_data.dart";
import "../model/automobile_model.dart";

/// Provider for automobile mock data, accessed through `Mockup.automobile`.
///
/// See [JsonDataProvider] for the available methods.
class AutomobileProvider extends JsonDataProvider<AutomobileModel> {
  AutomobileProvider._() : super(AutomobileData.json, AutomobileModel.fromJson);

  /// The singleton instance of [AutomobileProvider].
  static final AutomobileProvider instance = AutomobileProvider._();
}
