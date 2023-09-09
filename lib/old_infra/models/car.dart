class Car {

  String? value;
  String? brand;
  String? model;
  int? year;
  String? fuel;
  String? fipeCode;
  String? refMonth;
  int? vehicleType;
  String? fuelChar;

  Car();
  factory Car.fromJson(Map<String, dynamic> data) {
    Car car = Car();

    car.value = data['Valor'];
    car.brand = data['Marca'];
    car.model = data['Modelo'];
    car.year = data['AnoModelo'];
    car.fuel = data['Combustivel'];
    car.fipeCode = data['CodigoFipe'];
    car.refMonth = data['MesReferencia'];
    car.vehicleType = data['TipoVeiculo'];
    car.fuelChar = data['SiglaCombustivel'];

    return car;
  }

  Map<String, dynamic> toJson() {
    return {
      'Valor': value,
      'Marca': brand,
      'Modelo': model,
      'AnoModelo': year,
      'Combustivel': fipeCode,
      'MesReferencia': refMonth,
      'TipoVeiculo': vehicleType,
      'SiglaCombustivel': fuelChar,
    };
  }

  String toShortString() {
    return '''Value: $value, 
      Brand: $brand, 
      Model: $model, 
      Year: $year''';
  }

  @override
  String toString() {
    return '''Value: $value, 
      Brand: $brand, 
      Model: $model, 
      Year: $year, 
      Fuel: $fuel,
      FipeCode: $fipeCode,
      RefMonth: $refMonth,
      VehicleType: $vehicleType,
      FuelChar: $fuelChar''';
  }

}