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

  When mockGetItemCall() => when(() => getItem(any()));
  void mockGetItem(List<Map> data) => mockGetItemCall().thenAnswer((_) async => data);
  void mockGetItemError() => mockGetItemCall().thenThrow(Exception());
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
    localStorage.mockGetItem(fipeInfosMap);
  });

  group('save', () {
    test('Shoud call LocalStorage with correct values', () async {
      await systemUnderTest.save(key: key, value: fipeInfosMap);
      
      verify(() => localStorage.setItem(key, fipeInfosMap)).called(1);
    });

    test('Should throw if setItem throws', () async {
      localStorage.mockSetItemError();
      final future = systemUnderTest.save(key: key, value: fipeInfosMap);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('load', () {
    test('Shoud call LocalStorage with correct key', () async {
      await systemUnderTest.load(key);
      
      verify(() => localStorage.getItem(key)).called(1);
    });

    test('Should return list of map on success', () async {
      final result = await systemUnderTest.load(key);

      expect(result, [{
        'price': fipeInfosMap[0]['price'],
        'brand': fipeInfosMap[0]['brand'],
        'model': fipeInfosMap[0]['model'],
        'modelYear': fipeInfosMap[0]['modelYear'],
      }]);
    });

    test('Should throw if getItem throws', () async {
      localStorage.mockGetItemError();
      final future = systemUnderTest.load(key);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });

  });
}
