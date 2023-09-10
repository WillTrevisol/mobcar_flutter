import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/usecases/usecases.dart';
import 'package:mobcar/main/factories/cache/cache.dart';

SaveFipeInfo localSaveFipeInfoFactory() {
  return LocalSaveFipeInfo(cacheStorage: cacheStorageAdapterFactory());
}
