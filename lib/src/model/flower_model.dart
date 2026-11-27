import "../utils/extension.dart";

/// Model representing flower data.
///
/// This class encapsulates all the properties of a flower and provides
/// methods for serialization to and from JSON.
class FlowerModel {
  /// Unique identifier for the flower.
  final String? id;

  /// Widely recognized name of the flower.
  final String? commonName;

  /// Taxonomic name of the flower.
  final String? scientificName;

  /// Available color variations of the flower.
  final List<String>? colors;

  /// Period when the flower normally blooms.
  final String? bloomingSeason;

  /// Cultural meanings associated with the flower.
  final List<String>? symbolism;

  /// Geographical areas where the flower naturally occurs.
  final String? nativeRegion;

  /// Whether the flower has a scent.
  final bool? fragrance;

  /// Amount of sunlight needed for optimal growth.
  final String? sunRequirements;

  /// Water needs for proper cultivation.
  final String? waterRequirements;

  /// Classification of the plant: "Perennial", "Annual" or "Deciduous Shrub".
  final String? plantType;

  /// Approximate cost per plant (no currency is specified).
  final double? price;

  /// Brief overview of the flower.
  final String? shortDescription;

  /// Detailed information about the flower.
  final String? description;

  /// Creates a [FlowerModel] instance with the provided properties.
  const FlowerModel({
    this.id,
    this.commonName,
    this.scientificName,
    this.colors,
    this.bloomingSeason,
    this.symbolism,
    this.nativeRegion,
    this.fragrance,
    this.sunRequirements,
    this.waterRequirements,
    this.plantType,
    this.price,
    this.shortDescription,
    this.description,
  });

  /// Creates a [FlowerModel] from a JSON map.
  ///
  /// The JSON keys are expected to use snake_case (e.g., "common_name") while
  /// the Dart properties use camelCase (e.g., commonName).
  factory FlowerModel.fromJson(Map<String, dynamic> json) => FlowerModel(
        id: json["id"],
        commonName: json["common_name"],
        scientificName: json["scientific_name"],
        colors: json["colors"] == null
            ? []
            : List<String>.from(json["colors"]!.map((x) => x)),
        bloomingSeason: json["blooming_season"],
        symbolism: json["symbolism"] == null
            ? []
            : List<String>.from(json["symbolism"]!.map((x) => x)),
        nativeRegion: json["native_region"],
        fragrance: json["fragrance"],
        sunRequirements: json["sun_requirements"],
        waterRequirements: json["water_requirements"],
        plantType: json["plant_type"],
        price: json["price"]?.toDouble(),
        shortDescription: json["short_description"],
        description: json["description"],
      );

  /// Converts this [FlowerModel] to a JSON map.
  ///
  /// The JSON keys use snake_case (e.g., "common_name") while the Dart
  /// properties use camelCase (e.g., commonName).
  Map<String, dynamic> toJson() => {
        "id": id,
        "common_name": commonName,
        "scientific_name": scientificName,
        "colors":
            colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "blooming_season": bloomingSeason,
        "symbolism": symbolism == null
            ? []
            : List<dynamic>.from(symbolism!.map((x) => x)),
        "native_region": nativeRegion,
        "fragrance": fragrance,
        "sun_requirements": sunRequirements,
        "water_requirements": waterRequirements,
        "plant_type": plantType,
        "price": price,
        "short_description": shortDescription,
        "description": description,
      };

  /// Returns a copy of this [FlowerModel] with the given fields replaced.
  FlowerModel copyWith({
    String? id,
    String? commonName,
    String? scientificName,
    List<String>? colors,
    String? bloomingSeason,
    List<String>? symbolism,
    String? nativeRegion,
    bool? fragrance,
    String? sunRequirements,
    String? waterRequirements,
    String? plantType,
    double? price,
    String? shortDescription,
    String? description,
  }) =>
      FlowerModel(
        id: id ?? this.id,
        commonName: commonName ?? this.commonName,
        scientificName: scientificName ?? this.scientificName,
        colors: colors ?? this.colors,
        bloomingSeason: bloomingSeason ?? this.bloomingSeason,
        symbolism: symbolism ?? this.symbolism,
        nativeRegion: nativeRegion ?? this.nativeRegion,
        fragrance: fragrance ?? this.fragrance,
        sunRequirements: sunRequirements ?? this.sunRequirements,
        waterRequirements: waterRequirements ?? this.waterRequirements,
        plantType: plantType ?? this.plantType,
        price: price ?? this.price,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
      );

  @override
  String toString() =>
      "FlowerModel(id: $id, commonName: $commonName, scientificName: $scientificName, colors: $colors, bloomingSeason: $bloomingSeason, symbolism: $symbolism, nativeRegion: $nativeRegion, fragrance: $fragrance, sunRequirements: $sunRequirements, waterRequirements: $waterRequirements, plantType: $plantType, price: $price, shortDescription: $shortDescription, description: $description)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowerModel &&
          other.id == id &&
          other.commonName == commonName &&
          other.scientificName == scientificName &&
          listEquals(other.colors, colors) &&
          other.bloomingSeason == bloomingSeason &&
          listEquals(other.symbolism, symbolism) &&
          other.nativeRegion == nativeRegion &&
          other.fragrance == fragrance &&
          other.sunRequirements == sunRequirements &&
          other.waterRequirements == waterRequirements &&
          other.plantType == plantType &&
          other.price == price &&
          other.shortDescription == shortDescription &&
          other.description == description;

  @override
  int get hashCode => Object.hash(
        id,
        commonName,
        scientificName,
        listHash(colors),
        bloomingSeason,
        listHash(symbolism),
        nativeRegion,
        fragrance,
        sunRequirements,
        waterRequirements,
        plantType,
        price,
        shortDescription,
        description,
      );
}
