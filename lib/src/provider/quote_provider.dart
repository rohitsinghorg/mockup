import "../base/json_data_provider.dart";
import "../data/quote_data.dart";
import "../model/quote_model.dart";

/// Provider for quote mock data, accessed through `Mockup.quote`.
///
/// See [JsonDataProvider] for the available methods.
class QuoteProvider extends JsonDataProvider<QuoteModel> {
  QuoteProvider._() : super(QuoteData.json, QuoteModel.fromJson);

  /// The singleton instance of [QuoteProvider].
  static final QuoteProvider instance = QuoteProvider._();
}
