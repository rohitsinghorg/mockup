import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

/// Runs the shared contract tests for a JSON-backed data provider.
void testDataProvider<T extends Object>(
  String name,
  JsonDataProvider<T> provider,
  T Function(Map<String, dynamic>) fromJson,
  Map<String, dynamic> Function(T) toJson,
) {
  group(name, () {
    final all = provider.getAll();
    final rawJson = provider.rawJson;

    test("getAll returns a non-empty list of distinct items", () {
      expect(all, isNotEmpty);
      expect(all.toSet().length, all.length);
    });

    test("getAll cannot be modified by callers", () {
      expect(() => provider.getAll().add(all.first), throwsUnsupportedError);
      expect(() => provider.getAll().clear(), throwsUnsupportedError);
      expect(provider.getAll(), hasLength(all.length));
    });

    test("getItemAt returns items in order and wraps around", () {
      for (var i = 0; i < all.length; i++) {
        expect(provider.getItemAt(i), same(all[i]));
      }
      expect(provider.getItemAt(all.length), same(all.first));
      expect(provider.getItemAt(all.length * 3 + 1), same(all[1 % all.length]));
      expect(provider.getItemAt(-1), same(all.last));
    });

    test("getItems returns exactly the requested count, cycling", () {
      expect(provider.getItems(), hasLength(1));
      expect(provider.getItems(0), isEmpty);
      final count = all.length * 2 + 3;
      final items = provider.getItems(count);
      expect(items, hasLength(count));
      for (var i = 0; i < count; i++) {
        expect(items[i], same(all[i % all.length]));
      }
    });

    test("getItems throws on a negative count", () {
      expect(() => provider.getItems(-1), throwsRangeError);
    });

    test("getShuffledList has the same items and leaves the source intact", () {
      final before = List.of(all);
      final shuffled = provider.getShuffledList();
      expect(shuffled, unorderedEquals(all));
      expect(provider.getAll(), orderedEquals(before));
      // The shuffled list is a fresh, modifiable copy.
      shuffled.removeLast();
      expect(provider.getAll(), hasLength(before.length));
    });

    test("getRandomItem returns an item from the collection", () {
      for (var i = 0; i < 50; i++) {
        expect(all, contains(provider.getRandomItem()));
      }
    });

    test("rawJson matches the parsed models", () {
      expect(rawJson, hasLength(all.length));
      for (var i = 0; i < rawJson.length; i++) {
        expect(fromJson(rawJson[i]), all[i]);
      }
    });

    test("every raw JSON key is mapped to a model field", () {
      for (final entry in rawJson) {
        final keys = toJson(fromJson(entry)).keys;
        expect(keys, containsAll(entry.keys), reason: "entry: $entry");
      }
    });

    test("toJson -> fromJson round-trips every item", () {
      for (final item in all) {
        expect(fromJson(toJson(item)), item);
      }
    });

    test("toString is descriptive", () {
      expect(all.first.toString(), isNot(startsWith("Instance of")));
    });

    group("getPage", () {
      test("splits the data into pages", () {
        const size = 4;
        final pages = (all.length / size).ceil();
        final collected = <T>[];
        for (var p = 1; p <= pages; p++) {
          final page = provider.getPage(p, pageSize: size);
          expect(page.page, p);
          expect(page.totalItems, all.length);
          expect(page.totalPages, pages);
          expect(page.hasNextPage, p < pages);
          expect(page.nextPage, p < pages ? p + 1 : null);
          collected.addAll(page.items);
        }
        expect(collected, orderedEquals(all));
      });

      test("returns an empty page past the end", () {
        final page = provider.getPage(1000, pageSize: 50);
        expect(page.items, isEmpty);
        expect(page.hasNextPage, isFalse);
      });

      test("cycles items to reach a custom totalItems", () {
        final total = all.length * 2 + 1;
        final last =
            provider.getPage(3, pageSize: all.length, totalItems: total);
        expect(last.items, [all.first]);
        expect(last.totalPages, 3);
        expect(last.hasNextPage, isFalse);
      });

      test("returned items cannot be modified", () {
        expect(() => provider.getPage(1).items.clear(), throwsUnsupportedError);
      });

      test("rejects invalid arguments", () {
        expect(() => provider.getPage(0), throwsRangeError);
        expect(() => provider.getPage(1, pageSize: 0), throwsRangeError);
        expect(() => provider.getPage(1, totalItems: -1), throwsRangeError);
      });
    });

    group("simulated network", () {
      test("fetch methods mirror the synchronous ones", () async {
        expect(await provider.fetchAll(delay: Duration.zero), same(all));
        expect(await provider.fetchItems(3, delay: Duration.zero),
            provider.getItems(3));
        expect(all,
            contains(await provider.fetchRandomItem(delay: Duration.zero)));
        final page =
            await provider.fetchPage(1, pageSize: 2, delay: Duration.zero);
        expect(page.items, provider.getPage(1, pageSize: 2).items);
      });
    });
  });
}

void main() {
  testDataProvider<AutomobileModel>("Mockup.automobile", Mockup.automobile,
      AutomobileModel.fromJson, (m) => m.toJson());
  testDataProvider<BuildingModel>("Mockup.building", Mockup.building,
      BuildingModel.fromJson, (m) => m.toJson());
  testDataProvider<EmojiModel>(
      "Mockup.emoji", Mockup.emoji, EmojiModel.fromJson, (m) => m.toJson());
  testDataProvider<FlowerModel>(
      "Mockup.flower", Mockup.flower, FlowerModel.fromJson, (m) => m.toJson());
  testDataProvider<QuoteModel>(
      "Mockup.quote", Mockup.quote, QuoteModel.fromJson, (m) => m.toJson());
  testDataProvider<UserModel>(
      "Mockup.user", Mockup.user, UserModel.fromJson, (m) => m.toJson());
}
