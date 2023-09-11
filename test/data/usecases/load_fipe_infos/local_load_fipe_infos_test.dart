import 'package:flutter_test/flutter_test.dart';
import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

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
}
