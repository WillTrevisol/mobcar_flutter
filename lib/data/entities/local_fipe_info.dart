import 'package:equatable/equatable.dart';

import 'package:mobcar/domain/entities/entities.dart';

class LocalFipeInfo extends Equatable {
  const LocalFipeInfo({
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
  });

  final String price;
  final String brand;
  final String model;
  final int modelYear;

  factory LocalFipeInfo.fromDomainEntity(FipeInfo fipeInfo) => LocalFipeInfo(
    price: fipeInfo.price,
    brand: fipeInfo.brand,
    model: fipeInfo.model,
    modelYear: fipeInfo.modelYear,
  );

  Map<String, dynamic> toMap() => {
    'price': price,
    'brand': brand,
    'model': model,
    'modelYear': modelYear,
  };
  
  @override
  List<Object?> get props => [ price, brand, model, modelYear ];
}
