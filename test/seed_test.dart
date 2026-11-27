import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

/// Calls a broad sample of generators and records the results.
List<Object?> sample() => [
      Mockup.user.getRandomItem(),
      Mockup.quote.getShuffledList(),
      Mockup.emoji.getRandomItem(),
      Mockup.number.randomDigit(0, 1000000),
      Mockup.number.randomHexString(8),
      Mockup.number.randomIPv6(),
      Mockup.number.randomDouble(),
      Mockup.number.randomHexColor(),
      Mockup.text.generateMediumParagraph(2),
      Mockup.text.alphanumeric(20),
      Mockup.text.title(),
      Mockup.internet.uuid(),
      Mockup.internet.email(),
      Mockup.date.past(from: DateTime.utc(2025)),
    ];

void main() {
  tearDown(Mockup.seed);

  test("the same seed reproduces the same values", () {
    Mockup.seed(42);
    final first = sample();
    Mockup.seed(42);
    expect(sample(), first);
  });

  test("different seeds produce different values", () {
    Mockup.seed(1);
    final first = sample();
    Mockup.seed(2);
    expect(sample(), isNot(first));
  });

  test("seed() with no argument restores non-deterministic output", () {
    Mockup.seed(7);
    final seeded = Mockup.internet.uuid();
    Mockup.seed();
    final values = {for (var i = 0; i < 20; i++) Mockup.internet.uuid()};
    expect(values, hasLength(20));
    expect(values, isNot(contains(seeded)));
  });

  test("fetch calls without failures do not disturb the seeded sequence",
      () async {
    Mockup.seed(3);
    final expected = [Mockup.number.randomDigit(), Mockup.number.randomDigit()];

    Mockup.seed(3);
    final a = Mockup.number.randomDigit();
    await Mockup.user.fetchItems(2, delay: Duration.zero);
    final b = Mockup.number.randomDigit();
    expect([a, b], expected);
  });
}
