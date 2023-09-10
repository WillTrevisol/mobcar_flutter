import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';

import 'package:mobcar/infra/cache/cache.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

class LocalStorageMock extends Mock implements LocalStorage {
  LocalStorageMock() {
    mockSetItem();
  }

  When mockSetItemCall() => when(() => setItem(any(), any()));
  void mockSetItem() => mockSetItemCall().thenAnswer((_) async => _);
  void mockSetItemError() => mockSetItemCall().thenThrow(Exception());
}

void main() {

  late LocalStorageMock localStorage;
  late CacheStorageAdapter systemUnderTest;
  late String key;
  late List<Map> fipeInfosMap;

  setUp(() {
    key = faker.guid.guid();
    fipeInfosMap = CacheFactory.listFipeInfos();
    localStorage = LocalStorageMock();
    systemUnderTest = CacheStorageAdapter(localStorage: localStorage);
  });

  test('Shoud call LocalStorage with correct values', () async {
    await systemUnderTest.save(key: key, value: fipeInfosMap);
    
    verify(() => localStorage.setItem(key, fipeInfosMap)).called(1);
  });

  test('Should throw if setItem throws', () async {
      localStorage.mockSetItemError();
      final future = systemUnderTest.save(key: key, value: fipeInfosMap);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
}
