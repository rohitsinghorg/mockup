import "../utils/extension.dart";

/// Model representing automobile data.
///
/// This class encapsulates all the properties of an automobile and provides
/// methods for serialization to and from JSON.
class AutomobileModel {
  /// Unique identifier for the automobile.
  final String? id;

  /// Manufacturer of the automobile.
  final String? make;

  /// Model name of the automobile.
  final String? model;

  /// Manufacturing year of the automobile.
  final int? year;

  /// Type of fuel used by the automobile: "Electric", "Gasoline", "Diesel"
  /// or "Hybrid".
  final String? fuelType;

  /// Indicates whether the automobile is environmentally friendly.
  final bool? isEcoFriendly;

  /// Engine power measured in horsepower.
  final int? horsepower;

  /// Fuel efficiency in miles per gallon (MPG); for electric cars, the range
  /// in miles.
  final double? mileage;

  /// User or expert rating of the automobile on a 0–5 scale.
  final double? rating;

  /// Brief description of the automobile.
  final String? shortDescription;

  /// Detailed description of the automobile.
  final String? description;

  /// List of notable features and specifications of the automobile.
  final List<String>? features;

  /// Creates an [AutomobileModel] instance with the provided properties.
  const AutomobileModel({
    this.id,
    this.make,
    this.model,
    this.year,
    this.fuelType,
    this.isEcoFriendly,
    this.horsepower,
    this.mileage,
    this.rating,
    this.shortDescription,
    this.description,
    this.features,
  });

  /// Creates an [AutomobileModel] from a JSON map.
  ///
  /// The JSON keys are expected to use snake_case (e.g., "fuel_type") while
  /// the Dart properties use camelCase (e.g., fuelType).
  factory AutomobileModel.fromJson(Map<String, dynamic> json) =>
      AutomobileModel(
        id: json["id"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        fuelType: json["fuel_type"],
        isEcoFriendly: json["is_eco_friendly"],
        horsepower: json["horsepower"],
        mileage: json["mileage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        shortDescription: json["short_description"],
        description: json["description"],
        features: json["features"] == null
            ? []
            : List<String>.from(json["features"]!.map((x) => x)),
      );

  /// Converts this [AutomobileModel] to a JSON map.
  ///
  /// The JSON keys use snake_case (e.g., "fuel_type") while the Dart
  /// properties use camelCase (e.g., fuelType).
  Map<String, dynamic> toJson() => {
        "id": id,
        "make": make,
        "model": model,
        "year": year,
        "fuel_type": fuelType,
        "is_eco_friendly": isEcoFriendly,
        "horsepower": horsepower,
        "mileage": mileage,
        "rating": rating,
        "short_description": shortDescription,
        "description": description,
        "features":
            features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
      };

  /// Returns a copy of this [AutomobileModel] with the given fields replaced.
  AutomobileModel copyWith({
    String? id,
    String? make,
    String? model,
    int? year,
    String? fuelType,
    bool? isEcoFriendly,
    int? horsepower,
    double? mileage,
    double? rating,
    String? shortDescription,
    String? description,
    List<String>? features,
  }) =>
      AutomobileModel(
        id: id ?? this.id,
        make: make ?? this.make,
        model: model ?? this.model,
        year: year ?? this.year,
        fuelType: fuelType ?? this.fuelType,
        isEcoFriendly: isEcoFriendly ?? this.isEcoFriendly,
        horsepower: horsepower ?? this.horsepower,
        mileage: mileage ?? this.mileage,
        rating: rating ?? this.rating,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
        features: features ?? this.features,
      );

  @override
  String toString() =>
      "AutomobileModel(id: $id, make: $make, model: $model, year: $year, fuelType: $fuelType, isEcoFriendly: $isEcoFriendly, horsepower: $horsepower, mileage: $mileage, rating: $rating, shortDescription: $shortDescription, description: $description, features: $features)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutomobileModel &&
          other.id == id &&
          other.make == make &&
          other.model == model &&
          other.year == year &&
          other.fuelType == fuelType &&
          other.isEcoFriendly == isEcoFriendly &&
          other.horsepower == horsepower &&
          other.mileage == mileage &&
          other.rating == rating &&
          other.shortDescription == shortDescription &&
          other.description == description &&
          listEquals(other.features, features);

  @override
  int get hashCode => Object.hash(
        id,
        make,
        model,
        year,
        fuelType,
        isEcoFriendly,
        horsepower,
        mileage,
        rating,
        shortDescription,
        description,
        listHash(features),
      );
}
