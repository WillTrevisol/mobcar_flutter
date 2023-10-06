import 'package:equatable/equatable.dart';

import 'package:mobcar/domain/entities/entities.dart';

class FipeInfoViewEntity extends Equatable {
  const FipeInfoViewEntity({
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
  
  @override
  List<Object?> get props => [ price, brand, model, modelYear, codeFipe ];

  FipeInfo toDomainEntity() => FipeInfo(
    price: price,
    brand: brand,
    model: model,
    modelYear: modelYear,
    codeFipe: codeFipe,
  );

}
