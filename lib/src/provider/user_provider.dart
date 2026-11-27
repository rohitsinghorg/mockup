import "../base/json_data_provider.dart";
import "../data/user_data.dart";
import "../model/user_model.dart";

/// Provider for user mock data, accessed through `Mockup.user`.
///
/// See [JsonDataProvider] for the available methods.
class UserProvider extends JsonDataProvider<UserModel> {
  UserProvider._() : super(UserData.json, UserModel.fromJson);

  /// The singleton instance of [UserProvider].
  static final UserProvider instance = UserProvider._();
}
