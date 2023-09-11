import 'package:equatable/equatable.dart';
import 'package:mobcar/domain/entities/entities.dart';

class RemoteFipeInfo extends Equatable {
  const RemoteFipeInfo({
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
  });

  final String price;
  final String brand;
  final String model;
  final int modelYear;

  factory RemoteFipeInfo.fromMap(Map<String, dynamic> data) {
    return RemoteFipeInfo(
      price: data['price'],
      brand: data['brand'],
      model: data['model'],
      modelYear: data['modelYear'],
    );
  }
  
  @override
  List<Object?> get props => [ price, brand, model, modelYear ];

  FipeInfo toDomainEntity() => FipeInfo(price: price, brand: brand, model: model, modelYear: modelYear);
}
