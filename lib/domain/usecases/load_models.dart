import 'package:mobcar/domain/entities/entities.dart';

abstract class LoadModels {
  Future<List<Model>> load();
}
