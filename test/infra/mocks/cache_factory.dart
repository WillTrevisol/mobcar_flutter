import 'package:faker/faker.dart';

class CacheFactory {
  static List<Map> listFipeInfos() => [
    {
      'price': faker.randomGenerator.string(10),
      'brand': faker.vehicle.make(),
      'model': faker.vehicle.model(),
      'modelYear': faker.randomGenerator.integer(2023, min: 1950),
      'codeFipe': faker.guid.guid(),
    }
  ];
}