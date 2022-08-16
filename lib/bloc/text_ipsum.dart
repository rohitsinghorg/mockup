import 'dart:math';

import '/utils/extension.dart';

import '../data/text_data.dart';

class TextIpsum {
  /// [short], [medium], [large] and [xLarge] is used to specify the sentence
  /// and paragraph length. These values are set as default.
  static const _short = 3, _medium = 5, _large = 8, _xLarge = 15;

  /// custom getters to access text's list and object
  String get rawText =>
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
            (index) => createSentence(
                numberOfSentence: Random()
                    .numberBetween(minSentenceLength, maxSentenceLength)))
        .toList()
        .join("\n")
        .trimRight();
  }

  /// The method [createSentence] is used to generate a random sentence. By
  /// default, it will generate one sentence. The [numberOfSentence] param will
  /// specify the number of sentences.
  String createSentence({int numberOfSentence = 1}) {
    return List.generate(numberOfSentence, (index) => _makeSentence())
        .toList()
        .join()
        .trimRight();
  }

  /// The method [createShortParagraph] is used to generate a short paragraph having
  /// words length between 3-5 words.
  String createShortParagraph([int numberOfParagraph = 1]) {
    return _makeParagraph(numberOfParagraph, _short, _medium);
  }

  /// The method [createMediumParagraph] is used to generate a short paragraph having
  /// words length between 5-8 words.
  String createMediumParagraph([int numberOfParagraph = 1]) {
    return _makeParagraph(numberOfParagraph, _medium, _large);
  }

  /// The method [createLargeParagraph] is used to generate a short paragraph having
  /// words length between 8-15 words.
  String createLargeParagraph([int numberOfParagraph = 1]) {
    return _makeParagraph(numberOfParagraph, _large, _xLarge);
  }
}
