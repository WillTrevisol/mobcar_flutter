import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/helpers/helpers.dart';

import '../../mocks/mocks.dart';

void main() {
  
  late CacheStorageMock cacheStorage;
  late LocalLoadFipeInfos systemUnderTest;

  setUp(() {
    cacheStorage = CacheStorageMock();
    systemUnderTest = LocalLoadFipeInfos(cacheStorage: cacheStorage);
  });

  test('Should call cacheStorage with correct key', () async {
    await systemUnderTest.load();

    verify(() => cacheStorage.load('fipe_infos')).called(1);
  });

  test('Should throw UnexpectedError if cacheStorage throws', () async {
    cacheStorage.mockLoadError();
    final future = systemUnderTest.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}
