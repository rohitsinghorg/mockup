import '/data/building_data.dart';
import '/model/building_model.dart';
import '/utils/extension.dart';

class Building {
  static final Building _building = Building._internal();

  factory Building() {
    return _building;
  }

  Building._internal();

  /// custom getters to access automobile's list and object

  List<BuildingModel> get list => buildingData;

  List<BuildingModel> listUpTo([int max = 1]) =>
      buildingData.getAppendList(max);

  BuildingModel get object => list.random();

  ///
  /// getters to receive specific type only
  int? get establishedIn => object.establishedIn;

  int? get numberOfBelowGroundFloors => object.numberOfBelowGroundFloors;

  int? get numberOfFloors => object.numberOfFloors;

  double? get heightInFt => object.heightInFt;

  double? get heightInMetres => object.heightInMetres;

  String? get country => object.country;

  String? get city => object.city;

  String? get name => object.name;
}
