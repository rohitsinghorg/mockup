## 2.0.0

### Breaking changes
* **Model fields are now `final`** and constructors are `const`. Use
  `copyWith` instead of assigning fields.
* **User JSON keys are now snake_case**, matching every other category:
  `first_name`, `last_name`, `nick_name`, `marital_status`, `address_line1`,
  `address_line2`, `zip_code`. Affects `Mockup.user.rawJson`,
  `UserModel.toJson()` and `UserModel.fromJson()`; Dart property names are
  unchanged.

See "Migrating from 1.x" in the README.

### Added
* **Reproducible output**: `Mockup.seed(42)` makes every generator
  deterministic; `Mockup.seed()` restores random output.
* **Simulated backend** on every data category: `fetchAll`, `fetchItems`,
  `fetchRandomItem` and `fetchPage`, with configurable `delay`
  (default `Mockup.defaultDelay`, 500 ms) and `failureRate`, which throws a
  `MockupException`.
* **Pagination**: `getPage` / `fetchPage` return a `MockPage` with
  `items`, `totalPages`, `hasNextPage` and `nextPage`. `totalItems` can
  simulate collections larger than the bundled data.
* `Mockup.date`: `between`, `past`, `future` and `birthday`.
* `Mockup.internet`: `uuid`, `username`, `email` and `url` (reserved
  `example.*` domains only).
* `Mockup.number`: `randomDouble`, `randomBool`, `randomPrice`,
  `randomColor`, `randomHexColor` and `randomPhoneNumber` (fictional
  555-01XX range).
* `Mockup.text`: `alphanumeric(length)`, `words`, `title` and `slug`.
* `JsonDataProvider` is exported as the common type of all data categories.
* Example app: "API Simulation" screen with infinite scroll, loading, errors
  and retry.

### Changed
* All data providers share one `JsonDataProvider` base class, replacing ~500
  lines of duplicated code.
* The 5 flowers that had no `id` now have one; every record in every
  category has a unique `id`.
* Corrected model documentation to match the actual data (e.g. `quoteType`
  values, `mileage` being the range in miles for electric cars).

### Documentation
* Rewritten README: field reference for every model, simulated API and
  seeding guides, real example outputs, recipes and an FAQ.
* New example README (shown on pub.dev's Example tab) and `CONTRIBUTING.md`
  with a step-by-step guide to adding a data category.
* Screenshots are shown on pub.dev and converted to WebP: 1.9 MB to 196 KB.
* Every public API member is documented (enforced by `public_member_api_docs`).

## 1.1.0

### Added
* `toString`, value equality (`==` / `hashCode`) and `copyWith` on every model.
  `print(user)` now shows the user's fields instead of `Instance of 'UserModel'`.
* `EmojiModel.order`: the Unicode sort order, previously present in the data
  but dropped during parsing.
* Test suite covering all providers, models, text and number generators.
* GitHub Actions CI (format, analyze, tests, pana) and automated publishing.
* `repository`, `issue_tracker` and `topics` in `pubspec.yaml`.

### Changed
* `getAll()` now returns an unmodifiable list. Previously callers could
  accidentally add or remove items from the shared data. Use
  `getAll().toList()` or `getShuffledList()` if you need a modifiable copy.
* `getItems()` throws a `RangeError` for a negative count.
* `Mockup.number.randomDigit(from, to)` throws an `ArgumentError` when
  `from > to`; the string generators and text generators throw a `RangeError`
  for negative lengths/counts.
* `IBaseProvider.getItems` now declares its count as optional (default 1),
  matching the implementations.

### Fixed
* `BuildingModel.fromJson` no longer fails when `area_sqm` is a whole number.
* Screenshots and example platform folders are no longer included in the
  published package (archive size reduced from 2 MB to ~125 KB).
* Corrected copy-pasted documentation in the data providers.
* README example used a non-existent `quote.text` field.
* Resolved the static analysis issues reported by pub.dev.

## 1.0.2
* Readme updated

## 1.0.1
* Provided the json support

## 1.0.0
* Restructured all the data.
* Introduced flower and number data

## 0.0.1

* Initial version of the library
  * Includes Automobile, Building, Emoji, Quote, User and Text data
