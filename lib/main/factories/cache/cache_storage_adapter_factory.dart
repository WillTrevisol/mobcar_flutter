import 'package:get_storage/get_storage.dart';

import 'package:mobcar/data/cache/cache.dart';
import 'package:mobcar/infra/cache/cache.dart';

CacheStorage cacheStorageAdapterFactory() {
  return CacheStorageAdapter(getStorage: GetStorage());
}
