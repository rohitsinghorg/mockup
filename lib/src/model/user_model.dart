/// Model representing user data.
///
/// Contains personal information, contact details, demographics,
/// and address information.
class UserModel {
  /// Title or prefix for the user's name: "Mr.", "Ms.", "Mrs." or "Dr.".
  final String? prefix;

  /// User's first name.
  final String? firstName;

  /// User's last name.
  final String? lastName;

  /// User's nickname or preferred name.
  final String? nickName;

  /// Gender of the user ("Male" or "Female").
  final String? gender;

  /// URL of the user's profile photo.
  ///
  /// Photos are hosted on randomuser.me, so displaying them requires a
  /// network connection.
  final String? image;

  /// Email address of the user.
  final String? email;

  /// Age of the user.
  final int? age;

  /// Mobile phone number of the user.
  final String? mobile;

  /// Address details of the user.
  final Address? address;

  /// Occupation or job title of the user.
  final String? occupation;

  /// Marital status of the user: "Single", "Married", "Divorced" or
  /// "Widowed".
  final String? maritalStatus;

  /// Education level or degree of the user.
  final String? education;

  /// Creates a [UserModel] instance with the provided properties.
  const UserModel({
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
  /// This includes deserializing the nested [Address] object. JSON keys use
  /// snake_case (e.g., "first_name") while the Dart properties use camelCase.
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        prefix: json["prefix"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        nickName: json["nick_name"],
        gender: json["gender"],
        image: json["image"],
        email: json["email"],
        age: json["age"],
        mobile: json["mobile"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        occupation: json["occupation"],
        maritalStatus: json["marital_status"],
        education: json["education"],
      );

  /// Converts this [UserModel] to a JSON map.
  ///
  /// Includes all properties, with [address] serialized using its [toJson]
  /// method. Keys use snake_case.
  Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "first_name": firstName,
        "last_name": lastName,
        "nick_name": nickName,
        "gender": gender,
        "image": image,
        "email": email,
        "age": age,
        "mobile": mobile,
        "address": address?.toJson(),
        "occupation": occupation,
        "marital_status": maritalStatus,
        "education": education,
      };

  /// Returns a copy of this [UserModel] with the given fields replaced.
  UserModel copyWith({
    String? prefix,
    String? firstName,
    String? lastName,
    String? nickName,
    String? gender,
    String? image,
    String? email,
    int? age,
    String? mobile,
    Address? address,
    String? occupation,
    String? maritalStatus,
    String? education,
  }) =>
      UserModel(
        prefix: prefix ?? this.prefix,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nickName: nickName ?? this.nickName,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        email: email ?? this.email,
        age: age ?? this.age,
        mobile: mobile ?? this.mobile,
        address: address ?? this.address,
        occupation: occupation ?? this.occupation,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        education: education ?? this.education,
      );

  @override
  String toString() =>
      "UserModel(prefix: $prefix, firstName: $firstName, lastName: $lastName, nickName: $nickName, gender: $gender, image: $image, email: $email, age: $age, mobile: $mobile, address: $address, occupation: $occupation, maritalStatus: $maritalStatus, education: $education)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          other.prefix == prefix &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.nickName == nickName &&
          other.gender == gender &&
          other.image == image &&
          other.email == email &&
          other.age == age &&
          other.mobile == mobile &&
          other.address == address &&
          other.occupation == occupation &&
          other.maritalStatus == maritalStatus &&
          other.education == education;

  @override
  int get hashCode => Object.hash(
        prefix,
        firstName,
        lastName,
        nickName,
        gender,
        image,
        email,
        age,
        mobile,
        address,
        occupation,
        maritalStatus,
        education,
      );
}

/// Model representing an address.
///
/// Contains geographical and mailing address information.
class Address {
  /// First line of the street address.
  final String? addressLine1;

  /// Second line of the street address (e.g., apartment or suite number).
  final String? addressLine2;

  /// City of residence.
  final String? city;

  /// Locality or neighborhood name.
  final String? locality;

  /// State or province.
  final String? state;

  /// Country name.
  final String? country;

  /// ZIP or postal code.
  final String? zipCode;

  /// Latitude coordinate of the location.
  final double? latitude;

  /// Longitude coordinate of the location.
  final double? longitude;

  /// Creates an [Address] instance with the provided properties.
  const Address({
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
  /// JSON keys use snake_case (e.g., "zip_code") while the Dart properties
  /// use camelCase (e.g., zipCode).
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        locality: json["locality"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  /// Converts this [Address] instance to a JSON map.
  ///
  /// All properties are included, with snake_case keys.
  Map<String, dynamic> toJson() => {
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "locality": locality,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "latitude": latitude,
        "longitude": longitude,
      };

  /// Returns a copy of this [Address] with the given fields replaced.
  Address copyWith({
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? locality,
    String? state,
    String? country,
    String? zipCode,
    double? latitude,
    double? longitude,
  }) =>
      Address(
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        city: city ?? this.city,
        locality: locality ?? this.locality,
        state: state ?? this.state,
        country: country ?? this.country,
        zipCode: zipCode ?? this.zipCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  @override
  String toString() =>
      "Address(addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, locality: $locality, state: $state, country: $country, zipCode: $zipCode, latitude: $latitude, longitude: $longitude)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          other.addressLine1 == addressLine1 &&
          other.addressLine2 == addressLine2 &&
          other.city == city &&
          other.locality == locality &&
          other.state == state &&
          other.country == country &&
          other.zipCode == zipCode &&
          other.latitude == latitude &&
          other.longitude == longitude;

  @override
  int get hashCode => Object.hash(
        addressLine1,
        addressLine2,
        city,
        locality,
        state,
        country,
        zipCode,
        latitude,
        longitude,
      );
}
