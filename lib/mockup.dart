/// Generate mock data for Flutter UI development, testing, and prototyping
/// without any API dependencies.
///
/// Access everything through the [Mockup] class, e.g. `Mockup.user.getItems(5)`.
library;

import "src/config.dart";
import "src/provider/automobile_provider.dart";
import "src/provider/building_provider.dart";
import "src/provider/date_provider.dart";
import "src/provider/emoji_provider.dart";
import "src/provider/flower_provider.dart";
import "src/provider/internet_provider.dart";
import "src/provider/number_provider.dart";
import "src/provider/quote_provider.dart";
import "src/provider/text_provider.dart";
import "src/provider/user_provider.dart";

export "src/base/json_data_provider.dart" show JsonDataProvider;
export "src/model/automobile_model.dart";
export "src/model/building_model.dart";
export "src/model/emoji_model.dart";
export "src/model/flower_model.dart";
export "src/model/mock_page.dart";
export "src/model/mockup_exception.dart";
export "src/model/quote_model.dart";
export "src/model/user_model.dart";

/// The entry point to all mock data.
///
/// Every category is a static field:
///
/// | Field                 | Provides                                      |
/// | --------------------- | --------------------------------------------- |
/// | [automobile]          | [AutomobileModel] records (20)                |
/// | [building]            | [BuildingModel] records (19)                  |
/// | [emoji]               | [EmojiModel] records (4,032)                  |
/// | [flower]              | [FlowerModel] records (15)                    |
/// | [quote]               | [QuoteModel] records (43)                     |
/// | [user]                | [UserModel] records (15)                      |
/// | [text]                | Words, titles, slugs, sentences, paragraphs   |
/// | [number]              | Numbers, prices, colors, phone numbers, IPs   |
/// | [date]                | Dates in a range, past/future, birthdays      |
/// | [internet]            | UUIDs, usernames, emails, URLs                |
///
/// The record categories are [JsonDataProvider]s and share one API:
/// synchronous access (`getAll`, `getItems`, `getRandomItem`, ...),
/// pagination (`getPage`) and simulated network calls (`fetchAll`,
/// `fetchItems`, `fetchPage`, ...).
///
/// ```dart
/// final users = Mockup.user.getItems(5);
/// final page = await Mockup.quote.fetchPage(1, pageSize: 10);
/// final title = Mockup.text.title();
/// ```
///
/// Use [seed] for reproducible output in tests and [defaultDelay] to control
/// the simulated latency.
class Mockup {
  // Private constructor to prevent instantiation
  Mockup._();

  /// Seeds the random number generator used by every provider.
  ///
  /// After `Mockup.seed(42)`, the same sequence of calls always returns the
  /// same values, which makes golden and widget tests deterministic. Call
  /// `Mockup.seed()` (no argument) to go back to non-deterministic output.
  ///
  /// ```dart
  /// setUp(() => Mockup.seed(42));
  /// ```
  ///
  /// Results depend on the order of calls, and may differ between Dart
  /// versions and platforms (VM vs. web).
  static void seed([int? seed]) => MockupConfig.seed(seed);

  /// The default delay of the simulated network methods (`fetchAll`,
  /// `fetchItems`, `fetchRandomItem`, `fetchPage`). Defaults to 500 ms.
  ///
  /// Set it to [Duration.zero] in tests to make those calls complete
  /// immediately.
  static Duration get defaultDelay => MockupConfig.defaultDelay;

  static set defaultDelay(Duration value) => MockupConfig.defaultDelay = value;

  /// Provides access to automobile mock data.
  ///
  /// Use this provider to retrieve automobile information such as make, model, year,
  /// and other vehicle-related properties.
  static final automobile = AutomobileProvider.instance;

  /// Provides access to building mock data.
  ///
  /// Use this provider to retrieve building information for UI development and testing.
  static final building = BuildingProvider.instance;

  /// Generates random dates: within a range, in the past or future, and
  /// birthdays.
  static final date = DateProvider.instance;

  /// Provides access to emoji mock data.
  ///
  /// Use this provider to retrieve emoji collections for UI elements.
  static final emoji = EmojiProvider.instance;

  /// Provides access to flower mock data.
  ///
  /// Use this provider to retrieve flower information for botanical applications
  /// or decorative UI elements.
  static final flower = FlowerProvider.instance;

  /// Generates internet-related values: UUIDs, usernames, emails and URLs.
  static final internet = InternetProvider.instance;

  /// Provides access to number mock data.
  ///
  /// Use this provider to retrieve random numbers, number strings, prices,
  /// colors, phone numbers and IP addresses.
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
