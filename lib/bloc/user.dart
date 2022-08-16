import '/utils/extension.dart';

import '../data/user_data.dart';
import '../model/user_model.dart';

class User {
  /// custom getters to access user's list and object

  List<UserModel> get list => userData;

  List<UserModel> listUpTo([int max = 1]) => userData.getAppendList(max);

  UserModel get object => list.random();

  ///
  /// getters to receive specific type only
  String? get prefix => object.prefix;

  String? get firstName => object.firstName;

  String? get lastName => object.lastName;

  String? get nickName => object.nickName;

  String? get gender => object.gender;

  String? get image => object.image;

  String? get email => object.email;

  int? get age => object.age;

  String? get mobile => object.mobile;

  AddressModel? get address => object.address;

  String? get occupation => object.occupation;

  String? get maritalStatus => object.maritalStatus;

  String? get education => object.education;
}
