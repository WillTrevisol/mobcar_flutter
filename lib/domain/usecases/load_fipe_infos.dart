import 'package:mobcar/domain/entities/entities.dart';

abstract class LoadFipeInfos {
  Future<List<FipeInfo>> load();
}
