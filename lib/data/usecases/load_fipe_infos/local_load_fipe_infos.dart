import 'package:mobcar/data/cache/cache.dart';
import 'package:mobcar/data/entities/entities.dart';
import 'package:mobcar/domain/entities/fipe_info.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class LocalLoadFipeInfos implements LoadFipeInfos {
  const LocalLoadFipeInfos({required this.cacheStorage});

  final CacheStorage cacheStorage;

  @override
  Future<List<FipeInfo>> load() async {
    try {
      final result = await cacheStorage.load('fipe_infos');
      return result.map<FipeInfo>((fipeInfo) => LocalFipeInfo.fromMap(fipeInfo).toDomainEntity()).toList();
    } catch(error) {
      throw DomainError.unexpected;
    }
  }

}
