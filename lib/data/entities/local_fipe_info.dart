import 'package:equatable/equatable.dart';

import 'package:mobcar/domain/entities/entities.dart';

class LocalFipeInfo extends Equatable {
  const LocalFipeInfo({
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
    required this.codeFipe,
  });

  final String price;
  final String brand;
  final String model;
  final String codeFipe;
  final int modelYear;

  factory LocalFipeInfo.fromDomainEntity(FipeInfo fipeInfo) => LocalFipeInfo(
    price: fipeInfo.price,
    brand: fipeInfo.brand,
    model: fipeInfo.model,
    modelYear: fipeInfo.modelYear,
    codeFipe: fipeInfo.codeFipe
  );

  FipeInfo toDomainEntity() => FipeInfo(
    price: price,
    brand: brand,
    model: model,
    modelYear: modelYear,
    codeFipe: codeFipe,
  );

  Map<String, dynamic> toMap() => {
    'price': price,
    'brand': brand,
    'model': model,
    'modelYear': modelYear,
    'codeFipe': codeFipe,
  };

  factory LocalFipeInfo.fromMap(Map data) => LocalFipeInfo(
    price: data['price'],
    brand: data['brand'],
    model: data['model'],
    modelYear: data['modelYear'],
    codeFipe: data['codeFipe']
  );
  
  @override
  List<Object?> get props => [ price, brand, model, modelYear, codeFipe ];
}
