import 'package:mobcar/domain/entities/entities.dart';

abstract class LoadBrands {
  Future<List<Brand>> load();
}
