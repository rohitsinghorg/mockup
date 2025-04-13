/// Model representing a quote.
///
/// This class encapsulates the details of a quote including the text,
/// author, related themes, and its type (e.g., inspirational, humorous).
class QuoteModel {
  /// Unique identifier for the quote.
  String? id;

  /// Name of the person who said or wrote the quote.
  String? author;

  /// The text of the quote itself.
  String? quote;

  /// List of themes associated with the quote (e.g., "motivation", "love").
  List<String>? themes;

  /// The type of quote (e.g., "famous", "anonymous").
  String? quoteType;

  /// Creates a [QuoteModel] instance with the provided properties.
  QuoteModel({
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
}
