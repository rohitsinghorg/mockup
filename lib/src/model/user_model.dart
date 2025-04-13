/// Model representing user data.
///
/// Contains personal information, contact details, demographics,
/// and address information.
class UserModel {
  /// Title or prefix for the user's name (e.g., "Mr.", "Dr.").
  String? prefix;

  /// User's first name.
  String? firstName;

  /// User's last name.
  String? lastName;

  /// User's nickname or preferred name.
  String? nickName;

  /// Gender of the user (e.g., "Male", "Female", "Other").
  String? gender;

  /// URL or path to the user's profile image.
  String? image;

  /// Email address of the user.
  String? email;

  /// Age of the user.
  int? age;

  /// Mobile phone number of the user.
  String? mobile;

  /// Address details of the user.
  Address? address;

  /// Occupation or job title of the user.
  String? occupation;

  /// Marital status of the user (e.g., "Single", "Married").
  String? maritalStatus;

  /// Education level or degree of the user.
  String? education;

  /// Creates a [UserModel] instance with the provided properties.
  UserModel({
    this.prefix,
    this.firstName,
    this.lastName,
    this.nickName,
    this.gender,
    this.image,
    this.email,
    this.age,
    this.mobile,
    this.address,
    this.occupation,
    this.maritalStatus,
    this.education,
  });

  /// Creates a [UserModel] from a JSON map.
  ///
  /// This includes deserializing the nested [Address] object.
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        prefix: json["prefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        nickName: json["nickName"],
        gender: json["gender"],
        image: json["image"],
        email: json["email"],
        age: json["age"],
        mobile: json["mobile"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        occupation: json["occupation"],
        maritalStatus: json["maritalStatus"],
        education: json["education"],
      );

  /// Converts this [UserModel] to a JSON map.
  ///
  /// Includes all properties, with [address] serialized using its [toJson] method.
  Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "firstName": firstName,
        "lastName": lastName,
        "nickName": nickName,
        "gender": gender,
        "image": image,
        "email": email,
        "age": age,
        "mobile": mobile,
        "address": address?.toJson(),
        "occupation": occupation,
        "maritalStatus": maritalStatus,
        "education": education,
      };
}

/// Model representing an address.
///
/// Contains geographical and mailing address information.
class Address {
  /// First line of the street address.
  String? addressLine1;

  /// Second line of the street address (e.g., apartment or suite number).
  String? addressLine2;

  /// City of residence.
  String? city;

  /// Locality or neighborhood name.
  String? locality;

  /// State or province.
  String? state;

  /// Country name.
  String? country;

  /// ZIP or postal code.
  String? zipCode;

  /// Latitude coordinate of the location.
  double? latitude;

  /// Longitude coordinate of the location.
  double? longitude;

  /// Creates an [Address] instance with the provided properties.
  Address({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.locality,
    this.state,
    this.country,
    this.zipCode,
    this.latitude,
    this.longitude,
  });

  /// Creates an [Address] from a JSON map.
  ///
  /// All fields are deserialized from matching JSON keys.
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        city: json["city"],
        locality: json["locality"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zipCode"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  /// Converts this [Address] instance to a JSON map.
  ///
  /// All properties are included.
  Map<String, dynamic> toJson() => {
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "city": city,
        "locality": locality,
        "state": state,
        "country": country,
        "zipCode": zipCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
