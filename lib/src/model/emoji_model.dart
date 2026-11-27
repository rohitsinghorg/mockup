/// Model representing emoji data.
///
/// This class encapsulates all the properties of an emoji and provides
/// methods for serialization to and from JSON.
class EmojiModel {
  /// The emoji character itself.
  final String? emoji;

  /// Full descriptive name of the emoji.
  final String? name;

  /// Shortcode format used in some applications (e.g., :smile:).
  final String? shortname;

  /// Space-separated Unicode code points of the emoji (e.g., "1f602").
  final String? unicode;

  /// HTML entity representation of the emoji.
  final String? html;

  /// The category and subcategory the emoji belongs to (e.g.,
  /// "Smileys & Emotion (face-smiling)").
  final String? category;

  /// Sort order of the emoji within the Unicode emoji list.
  ///
  /// Only available for about 30% of emoji; `null` otherwise.
  final int? order;

  /// Creates an [EmojiModel] instance with the provided properties.
  const EmojiModel({
    this.emoji,
    this.name,
    this.shortname,
    this.unicode,
    this.html,
    this.category,
    this.order,
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
        order: json["order"] == null
            ? null
            : int.tryParse(json["order"].toString()),
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
        "order": order?.toString(),
      };

  /// Returns a copy of this [EmojiModel] with the given fields replaced.
  EmojiModel copyWith({
    String? emoji,
    String? name,
    String? shortname,
    String? unicode,
    String? html,
    String? category,
    int? order,
  }) =>
      EmojiModel(
        emoji: emoji ?? this.emoji,
        name: name ?? this.name,
        shortname: shortname ?? this.shortname,
        unicode: unicode ?? this.unicode,
        html: html ?? this.html,
        category: category ?? this.category,
        order: order ?? this.order,
      );

  @override
  String toString() =>
      "EmojiModel(emoji: $emoji, name: $name, shortname: $shortname, unicode: $unicode, html: $html, category: $category, order: $order)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmojiModel &&
          other.emoji == emoji &&
          other.name == name &&
          other.shortname == shortname &&
          other.unicode == unicode &&
          other.html == html &&
          other.category == category &&
          other.order == order;

  @override
  int get hashCode => Object.hash(
        emoji,
        name,
        shortname,
        unicode,
        html,
        category,
        order,
      );
}
