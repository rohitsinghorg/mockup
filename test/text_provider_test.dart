import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

/// Number of sentences in [text]; every generated sentence ends with a period
/// and the source words contain no punctuation.
int sentenceCount(String text) => ".".allMatches(text).length;

void main() {
  final text = Mockup.text;
  const iterations = 200;

  test("randomAlphanumeric is 10 alphanumeric characters", () {
    for (var i = 0; i < iterations; i++) {
      expect(text.randomAlphanumeric, matches(RegExp(r"^[A-Za-z0-9]{10}$")));
    }
  });

  group("generateSentences", () {
    test("returns one capitalised sentence by default", () {
      for (var i = 0; i < iterations; i++) {
        final sentence = text.generateSentences();
        expect(sentenceCount(sentence), 1);
        expect(sentence, matches(RegExp(r"^[A-Z][a-z ]+\.$")));
      }
    });

    test("returns the requested number of sentences, trimmed", () {
      final result = text.generateSentences(numberOfSentence: 4);
      expect(sentenceCount(result), 4);
      expect(result, result.trim());
    });

    test("each sentence has between 5 and 15 words", () {
      for (var i = 0; i < iterations; i++) {
        final words = text.generateSentences().split(" ");
        expect(words.length, inInclusiveRange(5, 15));
      }
    });

    test("returns an empty string for zero sentences", () {
      expect(text.generateSentences(numberOfSentence: 0), isEmpty);
    });

    test("throws on a negative count", () {
      expect(
          () => text.generateSentences(numberOfSentence: -1), throwsRangeError);
    });
  });

  group("paragraphs", () {
    final cases = <String, (String Function([int]), int, int)>{
      "short": (text.generateShortParagraph, 3, 5),
      "medium": (text.generateMediumParagraph, 5, 8),
      "long": (text.generateLongParagraph, 8, 15),
    };

    cases.forEach((name, spec) {
      final (generate, minSentences, maxSentences) = spec;

      test("$name paragraphs have $minSentences-$maxSentences sentences", () {
        for (var i = 0; i < 50; i++) {
          expect(sentenceCount(generate()),
              inInclusiveRange(minSentences, maxSentences));
        }
      });

      test("$name returns the requested number of paragraphs", () {
        final paragraphs = generate(3).split("\n");
        expect(paragraphs, hasLength(3));
        for (final paragraph in paragraphs) {
          expect(paragraph, isNotEmpty);
        }
      });

      test("$name throws on a negative count", () {
        expect(() => generate(-1), throwsRangeError);
      });
    });
  });

  group("word helpers", () {
    test("alphanumeric honours the requested length", () {
      expect(text.alphanumeric(), hasLength(10));
      expect(text.alphanumeric(0), isEmpty);
      expect(text.alphanumeric(64), matches(RegExp(r"^[A-Za-z0-9]{64}$")));
      expect(() => text.alphanumeric(-1), throwsRangeError);
    });

    test("words returns the requested number of lowercase words", () {
      expect(text.words(), matches(RegExp(r"^[a-z]+$")));
      expect(text.words(5).split(" "), hasLength(5));
      expect(text.words(0), isEmpty);
      expect(() => text.words(-1), throwsRangeError);
    });

    test("title is Title Case", () {
      for (var i = 0; i < iterations; i++) {
        expect(
            text.title(), matches(RegExp(r"^[A-Z][a-z]*( [A-Z][a-z]*){2}$")));
      }
      expect(text.title(1), matches(RegExp(r"^[A-Z][a-z]*$")));
    });

    test("slug is lowercase words joined by hyphens", () {
      for (var i = 0; i < iterations; i++) {
        expect(text.slug(), matches(RegExp(r"^[a-z]+-[a-z]+-[a-z]+$")));
      }
    });
  });
}
