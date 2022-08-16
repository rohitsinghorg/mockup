class UserModel {
  String? prefix;
  String? firstName;
  String? lastName;
  String? nickName;
  String? gender;
  String? image;
  String? email;
  int? age;
  String? mobile;
  AddressModel? address;
  String? occupation;
  String? maritalStatus;
  String? education;

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
}

class AddressModel {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? locality;
  String? country;
  String? zipCode;
  double? latitude;
  double? longitude;

  AddressModel({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.locality,
    this.country,
    this.zipCode,
    this.latitude,
    this.longitude,
  });
}
