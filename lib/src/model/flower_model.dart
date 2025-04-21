/// Model representing flower data.
///
/// This class encapsulates all the properties of a flower and provides
/// methods for serialization to and from JSON.
class FlowerModel {
  /// Unique identifier for the flower.
  String? id;

  /// Widely recognized name of the flower.
  String? commonName;

  /// Taxonomic name of the flower.
  String? scientificName;

  /// Available color variations of the flower.
  List<String>? colors;

  /// Period when the flower normally blooms.
  String? bloomingSeason;

  /// Cultural meanings associated with the flower.
  List<String>? symbolism;

  /// Geographical areas where the flower naturally occurs.
  String? nativeRegion;

  /// Whether the flower has a scent.
  bool? fragrance;

  /// Amount of sunlight needed for optimal growth.
  String? sunRequirements;

  /// Water needs for proper cultivation.
  String? waterRequirements;

  /// Classification of the plant (e.g., "Perennial", "Annual").
  String? plantType;

  /// Approximate cost per plant.
  double? price;

  /// Brief overview of the flower.
  String? shortDescription;

  /// Detailed information about the flower.
  String? description;

  /// Creates a [FlowerModel] instance with the provided properties.
  FlowerModel({
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
}
