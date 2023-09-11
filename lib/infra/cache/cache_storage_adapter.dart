import 'package:get_storage/get_storage.dart';
import 'package:mobcar/data/cache/cache.dart';

class CacheStorageAdapter implements CacheStorage {
  const CacheStorageAdapter({required this.getStorage});

  final GetStorage getStorage;

  @override
  Future<void> save({required String key, required value}) async {
    await getStorage.write(key, value);
  }
  
  @override
  Future load(String key) async {
    final result = await getStorage.read(key);
    return result;
  }

}
