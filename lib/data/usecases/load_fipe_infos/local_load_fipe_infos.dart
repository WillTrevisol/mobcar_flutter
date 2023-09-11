import 'package:mobcar/data/cache/cache.dart';
import 'package:mobcar/domain/entities/fipe_info.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class LocalLoadFipeInfos implements LoadFipeInfos {
  const LocalLoadFipeInfos({required this.cacheStorage});

  final CacheStorage cacheStorage;

  @override
  Future<List<FipeInfo>> load() async {
    await cacheStorage.load('fipe_infos');
    return [const FipeInfo(price: 'price', brand: 'brand', model: 'model', modelYear: 1)];
  }

}
