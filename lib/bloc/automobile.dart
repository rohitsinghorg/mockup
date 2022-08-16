import '/data/automobile_data.dart';
import '/model/automobile_model.dart';
import '/utils/extension.dart';

///
/// The [Automobile] class is used to retrieve the automobile's data.
///
/// A [list] getter will return the available automobile's list.
/// [listUpTo] method will generate any number of data. In this case, the data
/// can be repeated. The [object] getter will return a random automobile object.
/// It will generate different result every time.
///

class Automobile {
  static final Automobile _automobile = Automobile._internal();

  factory Automobile() {
    return _automobile;
  }

  Automobile._internal();

  /// custom getters to access automobile's list and object

  List<AutomobileModel> get list => autoMobileData;

  List<AutomobileModel> listUpTo([int max = 1]) =>
      autoMobileData.getAppendList(max);

  AutomobileModel get object => list.random();

  /// getters to receive specific type only
  ///
  bool? get isTransmissionAutomatic => object.isTransmissionAutomatic;

  String? get fuelType => object.fuelType;

  int? get fuelTankCapacity => object.fuelTankCapacity;

  int? get seatingCapacity => object.seatingCapacity;

  String? get transmission => object.transmission;

  double? get bhp => object.bhp;

  int? get engineInCC => object.engineInCC;

  double? get mileage => object.mileage;

  String? get bodyType => object.bodyType;

  String? get model => object.model;

  String? get name => object.name;

}
