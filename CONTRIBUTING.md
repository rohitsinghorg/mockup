# Contributing to Mockup

Thanks for helping improve Mockup! Bug reports, data fixes, new generators
and new data categories are all welcome.

## Getting started

```bash
git clone https://github.com/rohitsinghorg/mockup.git
cd mockup
flutter pub get
(cd example && flutter pub get)
```

## Before you open a pull request

CI runs these checks on every pull request; please run them locally first:

```bash
dart format lib test example/lib example/test   # formatting
flutter analyze --fatal-infos                     # static analysis + doc lint
flutter test                                      # package tests
(cd example && flutter test)                      # example app tests
```

If `flutter test` can't start its test device on your machine, run the same
tests in Chrome with `flutter test --platform chrome`.

Also:

- **Document every public member.** The `public_member_api_docs` lint is
  enabled; include a short example where it helps.
- **Add tests** for new behavior. Anything random should be tested over many
  iterations or with `Mockup.seed`.
- **Update `CHANGELOG.md`** under the next version.
- **Use only the shared random generator** (`mockupRandom` from
  `lib/src/utils/extension.dart`), never `Random()`, so that `Mockup.seed`
  keeps working.

## Project layout

```
lib/
  mockup.dart                  # public API: the Mockup class and exports
  src/
    base/json_data_provider.dart   # shared API of all record categories
    config.dart                    # seed and default delay
    data/                          # bundled datasets (const JSON)
    model/                         # immutable models
    provider/                      # one provider per category/generator
    utils/extension.dart           # shared random + list helpers
test/                          # package tests
example/                       # demo app (also shown on pub.dev)
```

## Adding a new data category

Every record category is a `JsonDataProvider`, so a new one takes four small
files. For a hypothetical `Mockup.product`:

1. **Data**: `lib/src/data/product_data.dart`

   ```dart
   /// Bundled product records used by [ProductProvider].
   class ProductData {
     /// Raw JSON data containing product information.
     static const json = [
       {"id": "p-001", "name": "Desk Lamp", "price": 39.99},
     ];
   }
   ```

   Use **snake_case** keys, give every record a unique `id`, and keep the data
   fictional or freely licensed (cite the source in the doc comment).

2. **Model**: `lib/src/model/product_model.dart`. Follow the existing models:
   `final` nullable fields, a `const` constructor, `fromJson` (use
   `?.toDouble()` for doubles), `toJson`, `copyWith`, `toString`, `==` and
   `hashCode` (use `listEquals`/`listHash` for list fields).

3. **Provider**: `lib/src/provider/product_provider.dart`

   ```dart
   /// Provider for product mock data, accessed through `Mockup.product`.
   class ProductProvider extends JsonDataProvider<ProductModel> {
     ProductProvider._() : super(ProductData.json, ProductModel.fromJson);

     /// The singleton instance of [ProductProvider].
     static final ProductProvider instance = ProductProvider._();
   }
   ```

4. **Wire it up** in `lib/mockup.dart`: add a documented
   `static final product = ProductProvider.instance;` to `Mockup` (and its
   table in the class doc), and export the model.

Then add the category to `test/data_provider_test.dart` with one
`testDataProvider<ProductModel>(...)` line. That runs the full shared contract
(pagination, JSON round-trips, unmapped keys…) against your data. Finally, add
the category to the README's tables.

## Releasing (maintainers)

1. Update the version in `pubspec.yaml` and the README's install snippet, and
   finalize `CHANGELOG.md`.
2. Run `flutter pub publish --dry-run`.
3. Commit, then tag and push: `git tag v2.0.0 && git push origin v2.0.0`.
   The [publish workflow](.github/workflows/publish.yml) publishes to pub.dev.
