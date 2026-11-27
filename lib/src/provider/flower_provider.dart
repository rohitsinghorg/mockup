import "../base/json_data_provider.dart";
import "../data/flower_data.dart";
import "../model/flower_model.dart";

/// Provider for flower mock data, accessed through `Mockup.flower`.
///
/// See [JsonDataProvider] for the available methods.
class FlowerProvider extends JsonDataProvider<FlowerModel> {
  FlowerProvider._() : super(FlowerData.json, FlowerModel.fromJson);

  /// The singleton instance of [FlowerProvider].
  static final FlowerProvider instance = FlowerProvider._();
}
