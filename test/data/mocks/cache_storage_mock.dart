import 'package:mocktail/mocktail.dart';

import 'package:mobcar/data/cache/cache.dart';

class CacheStorageMock extends Mock implements CacheStorage {
  CacheStorageMock() {
    mockSave();
    mockLoad();
  }

  When mockSaveCall() => when(() => save(key: any(named: 'key'), value: any(named: 'value')));
  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => mockSaveCall().thenThrow(Exception());

  When mockLoadCall() => when(() => load(any()));
  void mockLoad() => mockLoadCall().thenAnswer((_) async => _);
  void mockLoadError() => mockLoadCall().thenThrow(Exception());
}