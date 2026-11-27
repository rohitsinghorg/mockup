import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

void main() {
  final number = Mockup.number;
  const iterations = 500;

  group("randomDigit", () {
    test("stays within the default range 0..99", () {
      for (var i = 0; i < iterations; i++) {
        expect(number.randomDigit(), inInclusiveRange(0, 99));
      }
    });

    test("is inclusive of both bounds", () {
      final seen = <int>{};
      for (var i = 0; i < iterations; i++) {
        final value = number.randomDigit(1, 3);
        expect(value, inInclusiveRange(1, 3));
        seen.add(value);
      }
      expect(seen, {1, 2, 3});
    });

    test("returns the bound when from == to", () {
      expect(number.randomDigit(7, 7), 7);
    });

    test("supports negative ranges", () {
      for (var i = 0; i < iterations; i++) {
        expect(number.randomDigit(-10, -5), inInclusiveRange(-10, -5));
      }
    });

    test("throws when from > to", () {
      expect(() => number.randomDigit(10, 5), throwsArgumentError);
    });
  });

  group("random strings", () {
    final generators = <String, (String Function([int]), RegExp)>{
      "decimal": (number.randomDecimalString, RegExp(r"^[0-9]*$")),
      "hex": (number.randomHexString, RegExp(r"^[0-9A-F]*$")),
      "binary": (number.randomBinaryString, RegExp(r"^[01]*$")),
      "octal": (number.randomOctalString, RegExp(r"^[0-7]*$")),
    };

    generators.forEach((name, spec) {
      final (generate, pattern) = spec;

      test("$name has the requested length and valid characters", () {
        expect(generate(), hasLength(1));
        expect(generate(0), isEmpty);
        for (final length in [1, 5, 32]) {
          final value = generate(length);
          expect(value, hasLength(length));
          expect(value, matches(pattern));
        }
      });

      test("$name throws on a negative length", () {
        expect(() => generate(-1), throwsRangeError);
      });
    });
  });

  group("IP addresses", () {
    test("randomIPv4 produces four octets in 0..255", () {
      for (var i = 0; i < iterations; i++) {
        final parts = number.randomIPv4().split(".");
        expect(parts, hasLength(4));
        for (final part in parts) {
          expect(int.parse(part), inInclusiveRange(0, 255));
        }
      }
    });

    test("randomIPv6 produces eight 4-digit hex groups", () {
      final pattern = RegExp(r"^[0-9a-f]{4}(:[0-9a-f]{4}){7}$");
      for (var i = 0; i < iterations; i++) {
        expect(number.randomIPv6(), matches(pattern));
      }
    });
  });

  group("randomDouble", () {
    test("stays within [min, max)", () {
      for (var i = 0; i < iterations; i++) {
        final v = number.randomDouble(1.5, 2.5);
        expect(v, greaterThanOrEqualTo(1.5));
        expect(v, lessThan(2.5));
      }
      expect(number.randomDouble(3, 3), 3);
    });

    test("throws when min > max", () {
      expect(() => number.randomDouble(2, 1), throwsArgumentError);
    });
  });

  group("randomBool", () {
    test("respects the extremes", () {
      for (var i = 0; i < 50; i++) {
        expect(number.randomBool(0), isFalse);
        expect(number.randomBool(1), isTrue);
      }
    });

    test("roughly follows the probability", () {
      Mockup.seed(5);
      addTearDown(Mockup.seed);
      final trues =
          List.generate(1000, (_) => number.randomBool(0.8)).where((b) => b);
      expect(trues.length, inInclusiveRange(740, 860));
    });

    test("rejects probabilities outside 0..1", () {
      expect(() => number.randomBool(1.1), throwsArgumentError);
      expect(() => number.randomBool(-0.1), throwsArgumentError);
    });
  });

  test("randomPrice has at most two decimals and stays in range", () {
    for (var i = 0; i < iterations; i++) {
      final price = number.randomPrice(min: 5, max: 10);
      expect(price, inInclusiveRange(5, 10));
      expect((price * 100).round() / 100, price);
    }
  });

  test("randomColor is fully opaque ARGB", () {
    for (var i = 0; i < iterations; i++) {
      final color = number.randomColor();
      expect(color >> 24, 0xFF);
      expect(color, lessThanOrEqualTo(0xFFFFFFFF));
    }
  });

  test("randomHexColor is #RRGGBB", () {
    for (var i = 0; i < iterations; i++) {
      expect(number.randomHexColor(), matches(RegExp(r"^#[0-9A-F]{6}$")));
    }
  });

  test("randomPhoneNumber uses the fictional 555-01XX range", () {
    final pattern = RegExp(r"^\+1-[2-9][0-9]{2}-555-01[0-9]{2}$");
    for (var i = 0; i < iterations; i++) {
      expect(number.randomPhoneNumber(), matches(pattern));
    }
  });
}
