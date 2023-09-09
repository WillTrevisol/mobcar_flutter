import 'package:equatable/equatable.dart';

class FipeInfoViewEntity extends Equatable {
  const FipeInfoViewEntity({
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
