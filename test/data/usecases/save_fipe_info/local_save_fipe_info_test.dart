import 'package:flutter_test/flutter_test.dart';

import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {

  late CacheStorageMock cacheStorage;
  late LocalSaveFipeInfo systemUnderTest;
  late List<FipeInfo> fipeInfoMock;

  setUp(() {
    fipeInfoMock = EntityFactory.fipeInfoList();
    cacheStorage = CacheStorageMock();
    systemUnderTest = LocalSaveFipeInfo(cacheStorage: cacheStorage);
  });

  test('Should call cacheStorage with correct values', () async {
    final fipeMapMock = [{
      'price': fipeInfoMock[0].price,
      'brand': fipeInfoMock[0].brand,
      'model': fipeInfoMock[0].model,
      'modelYear': fipeInfoMock[0].modelYear,
    }, {
      'price': fipeInfoMock[1].price,
      'brand': fipeInfoMock[1].brand,
      'model': fipeInfoMock[1].model,
      'modelYear': fipeInfoMock[1].modelYear,
    }];
    await systemUnderTest.save(fipeInfoMock);

    verify(() => cacheStorage.save(key: 'fipe_infos', value: fipeMapMock)).called(1);
  });

  test('Should throw unexpected error if save throws', () async {
    cacheStorage.mockSaveError();
    final future = systemUnderTest.save(fipeInfoMock);
    expect(future, throwsA(DomainError.unexpected));
  });
}
