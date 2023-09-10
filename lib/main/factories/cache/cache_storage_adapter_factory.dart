import 'package:localstorage/localstorage.dart';

import 'package:mobcar/data/cache/cache.dart';
import 'package:mobcar/infra/cache/cache.dart';

CacheStorage cacheStorageAdapterFactory() {
  return CacheStorageAdapter(localStorage: LocalStorage('mobcar'));
}
