import 'package:mobcar/domain/entities/entities.dart';

abstract class SaveFipeInfo {
  Future<void> save(List<FipeInfo> fipeInfos);
}
