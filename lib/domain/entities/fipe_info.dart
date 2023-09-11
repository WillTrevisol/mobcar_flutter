import 'package:equatable/equatable.dart';

class FipeInfo extends Equatable {
  const FipeInfo({
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
  });

  final String price;
  final String brand;
  final String model;
  final int modelYear;
  
  @override
  List<Object?> get props => [ price, brand, model, modelYear ];

}
