import 'package:mobcar/models/car_brand.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobx/mobx.dart';

import '../models/car.dart';
import '../models/car_year.dart';
part 'new_car_store.g.dart';

// ignore: library_private_types_in_public_api
class NewCarStore = _NewCarStoreBase with _$NewCarStore;

abstract class _NewCarStoreBase with Store {
  
  @observable
  List<CarBrand> brands = [];

  @action
  void addBrands(List<CarBrand> data) {
    for (CarBrand carBrand in data) {
      brands.add(carBrand);
    }
  }

  @observable
  CarBrand? carBrand;

  @action
  void setCarBrand(CarBrand? value) => carBrand = value;

  @observable
  String? brandCode;

  @action
  void setBrandCode(String? value) => brandCode = value;

  @observable
  List<CarModel> models = [];

  @action
  void addModels(List<CarModel> data) {
    for(CarModel carModel in data) {
      models.add(carModel);
    }
  }

  @observable
  CarModel? carModel;

  @action
  void setCarModel(CarModel value) => carModel = value;

  @observable
  int? modelCode;

  @action
  void setModelCode(int? value) => modelCode = value; 

  @observable
  List<CarYear> years = [];

  @action
  void addYears(List<CarYear> data) {
    for (CarYear carYear in data) {
      years.add(carYear);
    }
  }

  @observable
  CarYear? carYear;

  @action
  void setCarYear(CarYear? value) => carYear = value;

  @observable
  String? yearCode;

  @action
  void setYearCode(String? value) => yearCode = value;

  @observable
  Car? car;

  @action
  void setCar(Car value) => car = value;
}