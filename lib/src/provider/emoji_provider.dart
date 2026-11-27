import "../base/json_data_provider.dart";
import "../data/emoji_data.dart";
import "../model/emoji_model.dart";

/// Provider for emoji mock data, accessed through `Mockup.emoji`.
///
/// See [JsonDataProvider] for the available methods.
class EmojiProvider extends JsonDataProvider<EmojiModel> {
  EmojiProvider._() : super(EmojiData.json, EmojiModel.fromJson);

  /// The singleton instance of [EmojiProvider].
  static final EmojiProvider instance = EmojiProvider._();
}
