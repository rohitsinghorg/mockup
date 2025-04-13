/// Model representing building data.
///
/// This class encapsulates all the properties of a building and provides
/// methods for serialization to and from JSON.
class BuildingModel {
  /// Unique identifier for the building.
  String? id;

  /// Name of the building.
  String? name;

  /// Geographical location of the building.
  String? location;

  /// Year when the building was constructed.
  int? yearBuilt;

  /// Number of floors in the building.
  int? floors;

  /// Total area of the building in square meters.
  double? areaSqm;

  /// Category of the building (e.g., "Commercial", "Residential").
  String? buildingType;

  /// Indicates whether the building has parking facilities.
  bool? hasParking;

  /// Name of the architect or firm that designed the building.
  String? architect;

  /// Height of the building in meters.
  double? elevation;

  /// Detailed description of the building.
  String? description;

  /// List of amenities and facilities available in the building.
  List<String>? facilities;

  /// Creates a [BuildingModel] instance with the provided properties.
  BuildingModel({
    this.id,
    this.name,
    this.location,
    this.yearBuilt,
    this.floors,
    this.areaSqm,
    this.buildingType,
    this.hasParking,
    this.architect,
    this.elevation,
    this.description,
    this.facilities,
  });

  /// Creates a [BuildingModel] from a JSON map.
  ///
  /// The JSON keys are expected to use snake_case (e.g., "year_built") while
  /// the Dart properties use camelCase (e.g., yearBuilt).
  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        yearBuilt: json["year_built"],
        floors: json["floors"],
        areaSqm: json["area_sqm"],
        buildingType: json["building_type"],
        hasParking: json["has_parking"],
        architect: json["architect"],
        elevation: json["elevation"]?.toDouble(),
        description: json["description"],
        facilities: json["facilities"] == null
            ? []
            : List<String>.from(json["facilities"]!.map((x) => x)),
      );

  /// Converts this [BuildingModel] to a JSON map.
  ///
  /// The JSON keys use snake_case (e.g., "year_built") while the Dart
  /// properties use camelCase (e.g., yearBuilt).
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "year_built": yearBuilt,
        "floors": floors,
        "area_sqm": areaSqm,
        "building_type": buildingType,
        "has_parking": hasParking,
        "architect": architect,
        "elevation": elevation,
        "description": description,
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x)),
      };
}
