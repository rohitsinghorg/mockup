/// Model representing emoji data.
///
/// This class encapsulates all the properties of an emoji and provides
/// methods for serialization to and from JSON.
class EmojiModel {
  /// The emoji character itself.
  String? emoji;

  /// Full descriptive name of the emoji.
  String? name;

  /// Shortcode format used in some applications (e.g., :smile:).
  String? shortname;

  /// Unicode code point representation of the emoji.
  String? unicode;

  /// HTML entity representation of the emoji.
  String? html;

  /// The category the emoji belongs to (e.g., "People & Body").
  String? category;

  /// Creates an [EmojiModel] instance with the provided properties.
  EmojiModel({
    this.emoji,
    this.name,
    this.shortname,
    this.unicode,
    this.html,
    this.category,
  });

  /// Creates an [EmojiModel] from a JSON map.
  ///
  /// Expected JSON structure should have matching keys for all properties.
  factory EmojiModel.fromJson(Map<String, dynamic> json) => EmojiModel(
        emoji: json["emoji"],
        name: json["name"],
        shortname: json["shortname"],
        unicode: json["unicode"],
        html: json["html"],
        category: json["category"],
      );

  /// Converts this [EmojiModel] to a JSON map.
  ///
  /// All properties are included in the resulting map.
  Map<String, dynamic> toJson() => {
        "emoji": emoji,
        "name": name,
        "shortname": shortname,
        "unicode": unicode,
        "html": html,
        "category": category,
      };
}
