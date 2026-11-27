import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

/// Age in whole years on [on] for someone born on [birth].
int ageOn(DateTime birth, DateTime on) {
  var age = on.year - birth.year;
  if (on.month < birth.month ||
      (on.month == birth.month && on.day < birth.day)) {
    age--;
  }
  return age;
}

void main() {
  const iterations = 500;

  group("Mockup.date", () {
    final start = DateTime.utc(2020, 1, 1);
    final end = DateTime.utc(2020, 12, 31);

    test("between stays within the range and keeps UTC", () {
      for (var i = 0; i < iterations; i++) {
        final d = Mockup.date.between(start, end);
        expect(d.isBefore(start), isFalse);
        expect(d.isAfter(end), isFalse);
        expect(d.isUtc, isTrue);
      }
      expect(Mockup.date.between(start, start), start);
    });

    test("between throws when start is after end", () {
      expect(() => Mockup.date.between(end, start), throwsArgumentError);
    });

    test("past and future are on the correct side of the reference", () {
      final ref = DateTime.utc(2024, 6, 1);
      const within = Duration(days: 10);
      for (var i = 0; i < iterations; i++) {
        final p = Mockup.date.past(within: within, from: ref);
        final f = Mockup.date.future(within: within, from: ref);
        expect(p.isAfter(ref), isFalse);
        expect(p.isBefore(ref.subtract(within)), isFalse);
        expect(f.isBefore(ref), isFalse);
        expect(f.isAfter(ref.add(within)), isFalse);
      }
    });

    test("birthday gives an age within the requested range", () {
      final ref = DateTime(2024, 2, 29);
      final ages = <int>{};
      for (var i = 0; i < iterations; i++) {
        final b = Mockup.date.birthday(minAge: 20, maxAge: 22, from: ref);
        expect(b, DateTime(b.year, b.month, b.day), reason: "no time part");
        final age = ageOn(b, ref);
        expect(age, inInclusiveRange(20, 22));
        ages.add(age);
      }
      expect(ages, {20, 21, 22});
    });

    test("birthday validates its arguments", () {
      expect(() => Mockup.date.birthday(minAge: -1), throwsRangeError);
      expect(() => Mockup.date.birthday(minAge: 30, maxAge: 20),
          throwsArgumentError);
    });
  });

  group("Mockup.internet", () {
    test("uuid is a valid, unique version 4 UUID", () {
      final pattern = RegExp(
          r"^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$");
      final seen = <String>{};
      for (var i = 0; i < iterations; i++) {
        final id = Mockup.internet.uuid();
        expect(id, matches(pattern));
        seen.add(id);
      }
      expect(seen, hasLength(iterations));
    });

    test("username is lowercase ASCII", () {
      for (var i = 0; i < iterations; i++) {
        expect(Mockup.internet.username(), matches(RegExp(r"^[a-z0-9._]+$")));
      }
    });

    test("email uses only reserved example domains", () {
      final pattern =
          RegExp(r"^[a-z0-9]+\.[a-z0-9]+[0-9]*@example\.(com|org|net)$");
      for (var i = 0; i < iterations; i++) {
        expect(Mockup.internet.email(), matches(pattern));
      }
      expect(Mockup.internet.email(domain: "test.dev"), endsWith("@test.dev"));
    });

    test("names with accents and punctuation are normalised", () {
      final all = {for (var i = 0; i < 3000; i++) Mockup.internet.email()};
      expect(all.any((e) => e.contains("martinez")), isTrue);
      expect(all.any((e) => e.contains("oconnor")), isTrue);
      expect(all.any((e) => e.contains("alfarsi")), isTrue);
    });

    test("url is an https URL on an example domain", () {
      final pattern =
          RegExp(r"^https://www\.example\.(com|org|net)/[a-z]+-[a-z]+-[a-z]+$");
      for (var i = 0; i < iterations; i++) {
        expect(Mockup.internet.url(), matches(pattern));
      }
    });
  });
}
