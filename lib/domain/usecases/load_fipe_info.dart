import 'package:mobcar/domain/entities/entities.dart';

abstract class LoadFipeInfo {
  Future<FipeInfo> load({required String brand, required String model, required String year});
}
