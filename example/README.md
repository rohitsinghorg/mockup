# Mockup example

A Flutter app showing every feature of [`mockup`](https://pub.dev/packages/mockup):
one screen per data category, the text and number generators, and an
infinite-scroll list backed by the simulated API.

## Run it

Requires Flutter 3.47 or newer (the app uses the
[`material_ui`](https://pub.dev/packages/material_ui) package).

```bash
git clone https://github.com/rohitsinghorg/mockup.git
cd mockup/example
flutter run
```

## Screens

| Screen | Shows | Source |
| --- | --- | --- |
| Automobile, Building, Emoji, Flower, Quote, User | `getAll`, `getItems`, `getItemAt`, `getRandomItem`, `getShuffledList`, `rawJson` | [`lib/screen/`](lib/screen/) |
| Text | Sentences and short, medium and long paragraphs | [`text_screen.dart`](lib/screen/text_screen.dart) |
| Number | Random digits, number strings and IP addresses | [`number_screen.dart`](lib/screen/number_screen.dart) |
| API Simulation | Infinite scroll with `fetchPage`, loading, random failures and retry | [`api_simulation_screen.dart`](lib/screen/api_simulation_screen.dart) |

## The essentials

```dart
import 'package:mockup/mockup.dart';

// Typed records
final users = Mockup.user.getItems(20);       // List<UserModel>
final quote = Mockup.quote.getRandomItem();   // QuoteModel
print('${quote.quote} (${quote.author})');

// Simulated API: 500 ms latency, paginated, fails 20% of the time
try {
  final page = await Mockup.user.fetchPage(1, pageSize: 10, failureRate: 0.2);
  print('Loaded ${page.items.length} of ${page.totalItems}');
} on MockupException catch (e) {
  print(e.message);
}

// Value generators
Mockup.text.title();          // "Sapien Libero Quis"
Mockup.internet.email();      // "satoshi.mthembu54@example.org"
Mockup.number.randomPrice();  // 348.27
Mockup.date.birthday();       // a date of birth for an 18–80 year old

// Reproducible output for tests
Mockup.seed(42);
```

### Infinite scroll in a nutshell

From [`api_simulation_screen.dart`](lib/screen/api_simulation_screen.dart):

```dart
Future<void> _fetch(int page) async {
  try {
    final result = await Mockup.user.fetchPage(
      page,
      pageSize: 10,
      totalItems: 60,
      failureRate: 0.2,
    );
    setState(() {
      _users.addAll(result.items);
      _nextPage = result.nextPage; // null once everything is loaded
    });
  } on MockupException catch (e) {
    setState(() => _error = e.message); // shows a Retry button
  }
}
```

## Tests

[`test/widget_test.dart`](test/widget_test.dart) opens every screen and walks
through the API Simulation flow, including retrying failed requests:

```bash
flutter test
```

See the [package README](https://github.com/rohitsinghorg/mockup#readme) for
the full documentation.
