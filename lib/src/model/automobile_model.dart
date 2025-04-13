/// Model representing automobile data.
///
/// This class encapsulates all the properties of an automobile and provides
/// methods for serialization to and from JSON.
class AutomobileModel {
  /// Unique identifier for the automobile.
  String? id;

  /// Manufacturer of the automobile.
  String? make;

  /// Model name of the automobile.
  String? model;

  /// Manufacturing year of the automobile.
  int? year;

  /// Type of fuel used by the automobile (e.g., "gasoline", "diesel", "electric").
  String? fuelType;

  /// Indicates whether the automobile is environmentally friendly.
  bool? isEcoFriendly;

  /// Engine power measured in horsepower.
  int? horsepower;

  /// Fuel efficiency measured in miles per gallon (MPG) or equivalent.
  double? mileage;

  /// User or expert rating of the automobile on a scale (typically 0-5).
  double? rating;

  /// Brief description of the automobile.
  String? shortDescription;

  /// Detailed description of the automobile.
  String? description;

  /// List of notable features and specifications of the automobile.
  List<String>? features;

  /// Creates an [AutomobileModel] instance with the provided properties.
  AutomobileModel({
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
  factory AutomobileModel.fromJson(Map<String, dynamic> json) => AutomobileModel(
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
    features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
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
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
  };
}