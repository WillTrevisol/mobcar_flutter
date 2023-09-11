import 'package:localstorage/localstorage.dart';
import 'package:mobcar/data/cache/cache.dart';

class CacheStorageAdapter implements CacheStorage {
  const CacheStorageAdapter({required this.localStorage});

  final LocalStorage localStorage;

  @override
  Future<void> save({required String key, required value}) async {
    await localStorage.setItem(key, value);
  }
  
  @override
  Future load(String key) {
    // TODO: implement load
    throw UnimplementedError();
  }

}
