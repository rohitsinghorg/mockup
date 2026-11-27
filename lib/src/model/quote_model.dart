import "../utils/extension.dart";

/// Model representing a quote.
///
/// This class encapsulates the details of a quote including the text,
/// author, related themes, and its type (e.g., inspirational, humorous).
class QuoteModel {
  /// Unique identifier for the quote.
  final String? id;

  /// Name of the person who said or wrote the quote.
  final String? author;

  /// The text of the quote itself.
  final String? quote;

  /// List of lowercase themes associated with the quote (e.g., "life",
  /// "perseverance").
  final List<String>? themes;

  /// The type of quote: "Motivational", "Inspirational" or "Philosophical".
  final String? quoteType;

  /// Creates a [QuoteModel] instance with the provided properties.
  const QuoteModel({
    this.id,
    this.author,
    this.quote,
    this.themes,
    this.quoteType,
  });

  /// Creates a [QuoteModel] from a JSON map.
  ///
  /// The JSON must contain matching keys for all properties.
  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["id"],
        author: json["author"],
        quote: json["quote"],
        themes: json["themes"] == null
            ? []
            : List<String>.from(json["themes"]!.map((x) => x)),
        quoteType: json["quote_type"],
      );

  /// Converts this [QuoteModel] instance to a JSON map.
  ///
  /// All fields are included in the output.
  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "quote": quote,
        "themes":
            themes == null ? [] : List<dynamic>.from(themes!.map((x) => x)),
        "quote_type": quoteType,
      };

  /// Returns a copy of this [QuoteModel] with the given fields replaced.
  QuoteModel copyWith({
    String? id,
    String? author,
    String? quote,
    List<String>? themes,
    String? quoteType,
  }) =>
      QuoteModel(
        id: id ?? this.id,
        author: author ?? this.author,
        quote: quote ?? this.quote,
        themes: themes ?? this.themes,
        quoteType: quoteType ?? this.quoteType,
      );

  @override
  String toString() =>
      "QuoteModel(id: $id, author: $author, quote: $quote, themes: $themes, quoteType: $quoteType)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteModel &&
          other.id == id &&
          other.author == author &&
          other.quote == quote &&
          listEquals(other.themes, themes) &&
          other.quoteType == quoteType;

  @override
  int get hashCode => Object.hash(
        id,
        author,
        quote,
        listHash(themes),
        quoteType,
      );
}
