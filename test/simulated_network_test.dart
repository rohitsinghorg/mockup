import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

void main() {
  final original = Mockup.defaultDelay;
  tearDown(() => Mockup.defaultDelay = original);

  test("defaultDelay is 500 ms out of the box", () {
    expect(Mockup.defaultDelay, const Duration(milliseconds: 500));
  });

  test("waits for the requested delay", () async {
    final watch = Stopwatch()..start();
    await Mockup.user.fetchItems(1, delay: const Duration(milliseconds: 80));
    expect(watch.elapsedMilliseconds, greaterThanOrEqualTo(75));
  });

  test("uses Mockup.defaultDelay when no delay is given", () async {
    Mockup.defaultDelay = const Duration(milliseconds: 80);
    final watch = Stopwatch()..start();
    await Mockup.quote.fetchRandomItem();
    expect(watch.elapsedMilliseconds, greaterThanOrEqualTo(75));

    Mockup.defaultDelay = Duration.zero;
    watch.reset();
    await Mockup.quote.fetchAll();
    expect(watch.elapsedMilliseconds, lessThan(75));
  });

  test("failureRate 1.0 always throws a MockupException", () async {
    await expectLater(
      Mockup.user.fetchAll(delay: Duration.zero, failureRate: 1),
      throwsA(isA<MockupException>()
          .having((e) => e.message, "message", "Simulated network error")),
    );
    await expectLater(
      Mockup.user.fetchPage(1, delay: Duration.zero, failureRate: 1),
      throwsA(isA<MockupException>()),
    );
  });

  test("failureRate fails roughly the requested share of calls", () async {
    Mockup.seed(11);
    addTearDown(Mockup.seed);
    var failures = 0;
    for (var i = 0; i < 400; i++) {
      try {
        await Mockup.flower
            .fetchRandomItem(delay: Duration.zero, failureRate: 0.25);
      } on MockupException {
        failures++;
      }
    }
    expect(failures, inInclusiveRange(60, 140));
  });

  test("rejects a failureRate outside 0..1", () async {
    await expectLater(
      Mockup.user.fetchAll(delay: Duration.zero, failureRate: 1.5),
      throwsArgumentError,
    );
    await expectLater(
      Mockup.user.fetchAll(delay: Duration.zero, failureRate: -0.1),
      throwsArgumentError,
    );
  });

  test("invalid arguments surface as a failed future", () async {
    await expectLater(
        Mockup.user.fetchItems(-1, delay: Duration.zero), throwsRangeError);
    await expectLater(
        Mockup.user.fetchPage(0, delay: Duration.zero), throwsRangeError);
  });

  test("MockPage.toString is descriptive", () {
    expect(Mockup.user.getPage(1, pageSize: 10).toString(),
        "MockPage(page: 1/2, items: 10, totalItems: 15)");
  });
}
