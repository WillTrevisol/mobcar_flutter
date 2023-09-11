import 'package:mobcar/domain/entities/entities.dart';

abstract class LoadYears {
  Future<List<Year>> load({required String brand, required String model});
}
