import "../utils/extension.dart";

/// Model representing building data.
///
/// This class encapsulates all the properties of a building and provides
/// methods for serialization to and from JSON.
class BuildingModel {
  /// Unique identifier for the building.
  final String? id;

  /// Name of the building.
  final String? name;

  /// Geographical location of the building.
  final String? location;

  /// Year when the building was constructed.
  final int? yearBuilt;

  /// Number of floors in the building.
  final int? floors;

  /// Total area of the building in square meters.
  final double? areaSqm;

  /// Category of the building (e.g., "Commercial", "Museum", "Monument").
  final String? buildingType;

  /// Indicates whether the building has parking facilities.
  final bool? hasParking;

  /// Name of the architect or firm that designed the building.
  final String? architect;

  /// Height of the building in meters.
  final double? elevation;

  /// Detailed description of the building.
  final String? description;

  /// List of amenities and facilities available in the building.
  final List<String>? facilities;

  /// Creates a [BuildingModel] instance with the provided properties.
  const BuildingModel({
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
        areaSqm: json["area_sqm"]?.toDouble(),
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

  /// Returns a copy of this [BuildingModel] with the given fields replaced.
  BuildingModel copyWith({
    String? id,
    String? name,
    String? location,
    int? yearBuilt,
    int? floors,
    double? areaSqm,
    String? buildingType,
    bool? hasParking,
    String? architect,
    double? elevation,
    String? description,
    List<String>? facilities,
  }) =>
      BuildingModel(
        id: id ?? this.id,
        name: name ?? this.name,
        location: location ?? this.location,
        yearBuilt: yearBuilt ?? this.yearBuilt,
        floors: floors ?? this.floors,
        areaSqm: areaSqm ?? this.areaSqm,
        buildingType: buildingType ?? this.buildingType,
        hasParking: hasParking ?? this.hasParking,
        architect: architect ?? this.architect,
        elevation: elevation ?? this.elevation,
        description: description ?? this.description,
        facilities: facilities ?? this.facilities,
      );

  @override
  String toString() =>
      "BuildingModel(id: $id, name: $name, location: $location, yearBuilt: $yearBuilt, floors: $floors, areaSqm: $areaSqm, buildingType: $buildingType, hasParking: $hasParking, architect: $architect, elevation: $elevation, description: $description, facilities: $facilities)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuildingModel &&
          other.id == id &&
          other.name == name &&
          other.location == location &&
          other.yearBuilt == yearBuilt &&
          other.floors == floors &&
          other.areaSqm == areaSqm &&
          other.buildingType == buildingType &&
          other.hasParking == hasParking &&
          other.architect == architect &&
          other.elevation == elevation &&
          other.description == description &&
          listEquals(other.facilities, facilities);

  @override
  int get hashCode => Object.hash(
        id,
        name,
        location,
        yearBuilt,
        floors,
        areaSqm,
        buildingType,
        hasParking,
        architect,
        elevation,
        description,
        listHash(facilities),
      );
}
