import 'dart:math';
import 'package:mockup/src/utils/extension.dart';
import '../data/text_data.dart';

/// Provider for generating random text content.
///
/// This class offers various methods to create random text strings,
/// from simple character sequences to structured paragraphs of different lengths.
/// It's useful for generating placeholder content for UI development and testing.
class TextProvider {
  /// Private constructor.
  TextProvider._();

  /// Singleton instance of the [TextProvider].
  static final TextProvider _instance = TextProvider._();

  /// Provides access to the singleton instance of [TextProvider].
  static TextProvider get instance => _instance;

  /// [short], [medium], [large] and [xLarge] is used to specify the sentence
  /// and paragraph length. These values are set as default.
  static const _short = 3, _medium = 5, _large = 8, _xLarge = 15;

  /// Generates a random alphanumeric string of 10 characters.
  ///
  /// Returns a string containing a random selection of uppercase letters,
  /// lowercase letters, and digits from the [rawData] constant.
  String get randomAlphanumeric =>
      List.generate(10, (index) => rawData[Random().nextInt(62)]).join();

  ///
  /// The private method [_makeSentence] is used to generate a sentence
  /// [minLength] and [maxLength] params is used to define the sentence length
  ///
  String _makeSentence([int minLength = _medium, int maxLength = _xLarge]) {
    int sentenceLength = Random().numberBetween(minLength, maxLength);
    int wordIndex =
        Random().numberBetween(0, textData.length - sentenceLength - 1);
    String sentence =
        textData.getRange(wordIndex, wordIndex + sentenceLength).join(" ");
    String sentenceWithCapitalAndPeriod =
        sentence[0].toUpperCase() + sentence.substring(1) + ". ";
    return sentenceWithCapitalAndPeriod;
  }

  ///
  /// The private method [_makeParagraph] is used to define a paragraph.
  String _makeParagraph(
      int numberOfParagraph, int minSentenceLength, int maxSentenceLength) {
    return List.generate(
            numberOfParagraph,
            (index) => generateSentences(
                numberOfSentence: Random()
                    .numberBetween(minSentenceLength, maxSentenceLength)))
        .toList()
        .join("\n")
        .trimRight();
  }

  /// Creates random sentences.
  ///
  /// Generates [numberOfSentence] grammatically structured random sentences
  /// using words from the text data collection.
  ///
  /// Parameters:
  /// - [numberOfSentence]: The number of sentences to generate (default: 1)
  ///
  /// Returns a string containing the generated sentences joined together.
  String generateSentences({int numberOfSentence = 1}) {
    return List.generate(numberOfSentence, (index) => _makeSentence())
        .toList()
        .join()
        .trimRight();
  }

  /// Creates a short paragraph of random text.
  ///
  /// Generates [numberOfParagraph] short paragraphs containing a small
  /// number of sentences.
  ///
  /// Parameters:
  /// - [numberOfParagraph]: The number of paragraphs to generate (default: 1)
  ///
  /// Returns a string containing the generated paragraphs joined together.
  String generateShortParagraph([int numberOfParagraph = 1]) {
    return _makeParagraph(numberOfParagraph, _short, _medium);
  }

  /// Creates a medium-length paragraph of random text.
  ///
  /// Generates [numberOfParagraph] medium-sized paragraphs with a moderate
  /// number of sentences.
  ///
  /// Parameters:
  /// - [numberOfParagraph]: The number of paragraphs to generate (default: 1)
  ///
  /// Returns a string containing the generated paragraphs joined together.
  String generateMediumParagraph([int numberOfParagraph = 1]) {
    return _makeParagraph(numberOfParagraph, _medium, _large);
  }

  /// Creates a long paragraph of random text.
  ///
  /// Generates [numberOfParagraph] lengthy paragraphs with a substantial
  /// number of sentences.
  ///
  /// Parameters:
  /// - [numberOfParagraph]: The number of paragraphs to generate (default: 1)
  ///
  /// Returns a string containing the generated paragraphs joined together.
  String generateLongParagraph([int numberOfParagraph = 1]) {
    return _makeParagraph(numberOfParagraph, _large, _xLarge);
  }
}
