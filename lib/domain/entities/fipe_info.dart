import 'package:equatable/equatable.dart';

class FipeInfo extends Equatable {
  const FipeInfo({
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

}
