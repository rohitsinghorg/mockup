import 'dart:math';

import '/data/user_data.dart';
import '/model/user_model.dart';
import '/utils/extension.dart';

class RandomGenerator {
  List<UserModel> usersList = userData;

  String? generateEmail() {
    return usersList.random().email;
  }

  String? generateFirstName() {
    return usersList.random().firstName;
  }

  String? generateLastName() {
    return usersList.random().lastName;
  }

  String? generateMobile() {
    return usersList.random().mobile;
  }

  int? generateRandomDigit([int from = 0, int to = 99]) {
    return Random().numberBetween(from, to);
  }

  // mathematics or computer
  String generateRandomDecimal([int length = 1]) {
    return List.generate(length, (index) => generateRandomDigit(0, 9)).join();
  }

  String generateRandomHexadecimal([int length = 1]) {
    return List.generate(
        length,
        (index) =>
            generateRandomDigit(0, 15)?.toRadixString(16).toUpperCase()).join();
  }

  String generateRandomBinary([int length = 1]) {
    return List.generate(length, (index) => generateRandomDigit(0, 1)).join();
  }

  String generateRandomOctal([int length = 1]) {
    return List.generate(length, (index) => generateRandomDigit(0, 7)).join();
  }

  // computer
  String? generateIPv4() {
    return "${Random().numberBetween(0, 255)}.${Random().numberBetween(0, 255)}.${Random().numberBetween(0, 255)}.${Random().numberBetween(0, 255)}";
  }

}
