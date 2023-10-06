import 'package:flutter_test/flutter_test.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/helpers/helpers.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {

  late CacheStorageMock cacheStorage;
  late LocalLoadFipeInfos systemUnderTest;
  late List<Map> fipeInfosMock; 

  setUp(() {
    cacheStorage = CacheStorageMock();
    systemUnderTest = LocalLoadFipeInfos(cacheStorage: cacheStorage);
    fipeInfosMock = CacheFactory.listFipeInfos();
    cacheStorage.mockLoad(fipeInfosMock);
  });

  test('Should call cacheStorage with correct key', () async {
    await systemUnderTest.load();

    verify(() => cacheStorage.load('fipe_infos')).called(1);
  });

  test('Should return List of FipeInfos on success', () async {
    final fipeInfos = await systemUnderTest.load();

    expect(fipeInfos, [
      FipeInfo(
        price: fipeInfosMock[0]['price'],
        brand: fipeInfosMock[0]['brand'],
        model: fipeInfosMock[0]['model'],
        modelYear: fipeInfosMock[0]['modelYear'],
        codeFipe: fipeInfosMock[0]['codeFipe'],
      )
    ]);
  });

  test('Should throw UnexpectedError if cacheStorage throws', () async {
    cacheStorage.mockLoadError();
    final future = systemUnderTest.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}
