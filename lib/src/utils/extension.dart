import 'dart:math';

///
/// [ListExtended] extension is used to add the additional
/// functionalities in the existing list.
///
/// [random] function will generate a random item [T] of the list
///
/// [getAppendList] function will append the list one after another to give the
/// unlimited data to the users.
///
/// [unique] function will remove the duplicate items in the list
///

extension ListExtended<T> on List<T> {
  T random() {
    return this[Random().nextInt(length)];
  }

  List<T> getAppendList([int max = 1]) {
    return List.generate(max, (index) => this[index % length]).toList();
  }

  List<T> unique() {
    return toSet().toList();
  }

  Future<List> withDelay({int seconds = 1}) async {
    await Future.delayed(Duration(seconds: seconds));
    return this;
  }
}

///
/// [RandomExtended] extension will add additional functionality in the Random
/// class.
///
/// [numberBetween] function will generate a random between two values. Example:
/// randomBetween(5, 9) will generate a random number between 5 to 9.
///

extension RandomExtended on Random {
  int numberBetween([int min = 0, int max = 9999]) {
    return Random().nextInt((max - min) + 1) + min;
  }
}
