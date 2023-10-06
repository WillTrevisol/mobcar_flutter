import 'package:mobcar/domain/entities/entities.dart';

abstract class LoadFipeInfoByCode {
  Future<FipeInfo> load(String codeFipe);
}
