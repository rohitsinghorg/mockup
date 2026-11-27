import "../base/json_data_provider.dart";
import "../data/building_data.dart";
import "../model/building_model.dart";

/// Provider for building mock data, accessed through `Mockup.building`.
///
/// See [JsonDataProvider] for the available methods.
class BuildingProvider extends JsonDataProvider<BuildingModel> {
  BuildingProvider._() : super(BuildingData.json, BuildingModel.fromJson);

  /// The singleton instance of [BuildingProvider].
  static final BuildingProvider instance = BuildingProvider._();
}
