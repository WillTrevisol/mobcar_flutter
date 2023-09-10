abstract class CacheStorage {
  Future<void> save({required String key, required dynamic value});
}
