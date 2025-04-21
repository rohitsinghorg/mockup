library mockup;

import "src/provider/automobile_provider.dart";
import "src/provider/building_provider.dart";
import "src/provider/emoji_provider.dart";
import "src/provider/flower_provider.dart";
import "src/provider/number_provider.dart";
import "src/provider/quote_provider.dart";
import "src/provider/text_provider.dart";
import "src/provider/user_provider.dart";

export "src/model/automobile_model.dart";
export "src/model/building_model.dart";
export "src/model/emoji_model.dart";
export "src/model/flower_model.dart";
export "src/model/quote_model.dart";
export "src/model/user_model.dart";

///
/// The `Mockup` class provides controlled access to various mockup data BLoCs.
///
class Mockup {
  // Private constructor to prevent instantiation
  Mockup._();

  /// Provides access to automobile mock data.
  ///
  /// Use this provider to retrieve automobile information such as make, model, year,
  /// and other vehicle-related properties.
  static final automobile = AutomobileProvider.instance;

  /// Provides access to building mock data.
  ///
  /// Use this provider to retrieve building information for UI development and testing.
  static final building = BuildingProvider.instance;

  /// Provides access to emoji mock data.
  ///
  /// Use this provider to retrieve emoji collections for UI elements.
  static final emoji = EmojiProvider.instance;

  /// Provides access to flower mock data.
  ///
  /// Use this provider to retrieve flower information for botanical applications
  /// or decorative UI elements.
  static final flower = FlowerProvider.instance;

  /// Provides access to number mock data.
  ///
  /// Use this provider to retrieve various number sequences and numerical data.
  static final number = NumberProvider.instance;

  /// Provides access to quote mock data.
  ///
  /// Use this provider to retrieve inspirational or placeholder quotes.
  static final quote = QuoteProvider.instance;

  /// Provides access to text mock data.
  ///
  /// Use this provider to retrieve placeholder text of various lengths
  /// for UI development and testing.
  static final text = TextProvider.instance;

  /// Provides access to user mock data.
  ///
  /// Use this provider to retrieve mock user profiles, credentials,
  /// and other user-related information.
  static final user = UserProvider.instance;
}
