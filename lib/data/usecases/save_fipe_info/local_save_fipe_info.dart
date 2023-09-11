import 'package:mobcar/data/cache/cache.dart';
import 'package:mobcar/data/entities/local_fipe_info.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class LocalSaveFipeInfo implements SaveFipeInfo {
  const LocalSaveFipeInfo({required this.cacheStorage});

  final CacheStorage cacheStorage;

  @override
  Future<void> save(List<FipeInfo> fipeInfos) async {
    try {
      final fipeInfoMap = fipeInfos.map((fipeInfo) => LocalFipeInfo.fromDomainEntity(fipeInfo).toMap()).toList();
      await cacheStorage.save(key: 'fipe_infos', value: fipeInfoMap);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
