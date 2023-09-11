import 'package:faker/faker.dart';
import 'package:mobcar/domain/entities/entities.dart';

class EntityFactory {
  static List<FipeInfo> fipeInfoList() => [
    FipeInfo(
      price: faker.randomGenerator.string(10),
      brand: faker.vehicle.make(),
      model: faker.vehicle.model(),
      modelYear: faker.randomGenerator.integer(2023, min: 1950),
    ),
    FipeInfo(
      price: faker.randomGenerator.string(10),
      brand: faker.vehicle.make(),
      model: faker.vehicle.model(),
      modelYear: faker.randomGenerator.integer(2023, min: 1950),
    ),
  ];
}
