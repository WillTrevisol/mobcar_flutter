// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarStore on _CarStoreBase, Store {
  late final _$brandsAtom =
      Atom(name: '_CarStoreBase.brands', context: context);

  @override
  ObservableList<CarBrand> get brands {
    _$brandsAtom.reportRead();
    return super.brands;
  }

  @override
  set brands(ObservableList<CarBrand> value) {
    _$brandsAtom.reportWrite(value, super.brands, () {
      super.brands = value;
    });
  }

  late final _$carBrandAtom =
      Atom(name: '_CarStoreBase.carBrand', context: context);

  @override
  CarBrand? get carBrand {
    _$carBrandAtom.reportRead();
    return super.carBrand;
  }

  @override
  set carBrand(CarBrand? value) {
    _$carBrandAtom.reportWrite(value, super.carBrand, () {
      super.carBrand = value;
    });
  }

  late final _$brandCodeAtom =
      Atom(name: '_CarStoreBase.brandCode', context: context);

  @override
  String? get brandCode {
    _$brandCodeAtom.reportRead();
    return super.brandCode;
  }

  @override
  set brandCode(String? value) {
    _$brandCodeAtom.reportWrite(value, super.brandCode, () {
      super.brandCode = value;
    });
  }

  late final _$modelsAtom =
      Atom(name: '_CarStoreBase.models', context: context);

  @override
  ObservableList<CarModel> get models {
    _$modelsAtom.reportRead();
    return super.models;
  }

  @override
  set models(ObservableList<CarModel> value) {
    _$modelsAtom.reportWrite(value, super.models, () {
      super.models = value;
    });
  }

  late final _$carModelAtom =
      Atom(name: '_CarStoreBase.carModel', context: context);

  @override
  CarModel? get carModel {
    _$carModelAtom.reportRead();
    return super.carModel;
  }

  @override
  set carModel(CarModel? value) {
    _$carModelAtom.reportWrite(value, super.carModel, () {
      super.carModel = value;
    });
  }

  late final _$modelCodeAtom =
      Atom(name: '_CarStoreBase.modelCode', context: context);

  @override
  int? get modelCode {
    _$modelCodeAtom.reportRead();
    return super.modelCode;
  }

  @override
  set modelCode(int? value) {
    _$modelCodeAtom.reportWrite(value, super.modelCode, () {
      super.modelCode = value;
    });
  }

  late final _$yearsAtom = Atom(name: '_CarStoreBase.years', context: context);

  @override
  ObservableList<CarYear> get years {
    _$yearsAtom.reportRead();
    return super.years;
  }

  @override
  set years(ObservableList<CarYear> value) {
    _$yearsAtom.reportWrite(value, super.years, () {
      super.years = value;
    });
  }

  late final _$carYearAtom =
      Atom(name: '_CarStoreBase.carYear', context: context);

  @override
  CarYear? get carYear {
    _$carYearAtom.reportRead();
    return super.carYear;
  }

  @override
  set carYear(CarYear? value) {
    _$carYearAtom.reportWrite(value, super.carYear, () {
      super.carYear = value;
    });
  }

  late final _$yearCodeAtom =
      Atom(name: '_CarStoreBase.yearCode', context: context);

  @override
  String? get yearCode {
    _$yearCodeAtom.reportRead();
    return super.yearCode;
  }

  @override
  set yearCode(String? value) {
    _$yearCodeAtom.reportWrite(value, super.yearCode, () {
      super.yearCode = value;
    });
  }

  late final _$carAtom = Atom(name: '_CarStoreBase.car', context: context);

  @override
  Car? get car {
    _$carAtom.reportRead();
    return super.car;
  }

  @override
  set car(Car? value) {
    _$carAtom.reportWrite(value, super.car, () {
      super.car = value;
    });
  }

  late final _$carsAtom = Atom(name: '_CarStoreBase.cars', context: context);

  @override
  ObservableList<Car> get cars {
    _$carsAtom.reportRead();
    return super.cars;
  }

  @override
  set cars(ObservableList<Car> value) {
    _$carsAtom.reportWrite(value, super.cars, () {
      super.cars = value;
    });
  }

  late final _$_CarStoreBaseActionController =
      ActionController(name: '_CarStoreBase', context: context);

  @override
  void addBrands(List<CarBrand> data) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.addBrands');
    try {
      return super.addBrands(data);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarBrand(CarBrand? value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setCarBrand');
    try {
      return super.setCarBrand(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBrandCode(String? value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setBrandCode');
    try {
      return super.setBrandCode(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addModels(List<CarModel> data) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.addModels');
    try {
      return super.addModels(data);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarModel(CarModel value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setCarModel');
    try {
      return super.setCarModel(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModelCode(int? value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setModelCode');
    try {
      return super.setModelCode(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addYears(List<CarYear> data) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.addYears');
    try {
      return super.addYears(data);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarYear(CarYear? value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setCarYear');
    try {
      return super.setCarYear(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYearCode(String? value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setYearCode');
    try {
      return super.setYearCode(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCar(Car value) {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.setCar');
    try {
      return super.setCar(value);
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCar() {
    final _$actionInfo = _$_CarStoreBaseActionController.startAction(
        name: '_CarStoreBase.addCar');
    try {
      return super.addCar();
    } finally {
      _$_CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
brands: ${brands},
carBrand: ${carBrand},
brandCode: ${brandCode},
models: ${models},
carModel: ${carModel},
modelCode: ${modelCode},
years: ${years},
carYear: ${carYear},
yearCode: ${yearCode},
car: ${car},
cars: ${cars}
    ''';
  }
}
