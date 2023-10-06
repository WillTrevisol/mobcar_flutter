import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';

import 'package:mobcar/infra/cache/cache.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

class GetStorageMock extends Mock implements GetStorage {
  GetStorageMock() {
    mockWrite();
  }

  When mockWriteCall() => when(() => write(any(), any()));
  void mockWrite() => mockWriteCall().thenAnswer((_) async => _);
  void mockWriteError() => mockWriteCall().thenThrow(Exception());

  When mockReadCall() => when(() => read(any()));
  void mockRead(List<Map> data) => mockReadCall().thenAnswer((_) async => data);
  void mockReadError() => mockReadCall().thenThrow(Exception());
}

void main() {

  late GetStorageMock getStorage;
  late CacheStorageAdapter systemUnderTest;
  late String key;
  late List<Map> fipeInfosMap;

  setUp(() {
    key = faker.guid.guid();
    fipeInfosMap = CacheFactory.listFipeInfos();
    getStorage = GetStorageMock();
    systemUnderTest = CacheStorageAdapter(getStorage: getStorage);
    getStorage.mockRead(fipeInfosMap);
  });

  group('save', () {
    test('Shoud call LocalStorage with correct values', () async {
      await systemUnderTest.save(key: key, value: fipeInfosMap);
      
      verify(() => getStorage.write(key, fipeInfosMap)).called(1);
    });

    test('Should throw if setItem throws', () async {
      getStorage.mockWriteError();
      final future = systemUnderTest.save(key: key, value: fipeInfosMap);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('load', () {
    test('Shoud call getStorage with correct key', () async {
      await systemUnderTest.load(key);
      
      verify(() => getStorage.read(key)).called(1);
    });

    test('Should return list of map on success', () async {
      final result = await systemUnderTest.load(key);

      expect(result, [{
        'price': fipeInfosMap[0]['price'],
        'brand': fipeInfosMap[0]['brand'],
        'model': fipeInfosMap[0]['model'],
        'modelYear': fipeInfosMap[0]['modelYear'],
        'codeFipe': fipeInfosMap[0]['codeFipe'],
      }]);
    });

    test('Should throw if getItem throws', () async {
      getStorage.mockReadError();
      final future = systemUnderTest.load(key);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });

  });
}
