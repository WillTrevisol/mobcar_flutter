import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';

import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/entities/entities.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  
  late HttpClientMock httpClientMock;
  late RemoteLoadModels systemUnderTest;
  late List<Map<String, dynamic>> modelsList;
  late String brand;
  late String url;

  setUp(() {
    url = faker.internet.httpUrl();
    brand = faker.vehicle.model();
    modelsList = ApiFactory.modelsList();
    httpClientMock = HttpClientMock();
    systemUnderTest = RemoteLoadModels(url: url, httpClient: httpClientMock);
    httpClientMock.mockGet(modelsList);
  });

  test('Should call HttpClient with correct values', () async {
    await systemUnderTest.load(brand);

    verify(() => httpClientMock.get(url: '$url/$brand/models')).called(1);
  });

  test('Should return list of Models on success', () async {
    final responseList = await systemUnderTest.load(brand);

    expect(responseList, [
      Model(
        name: modelsList[0]['name'],
        code: modelsList[0]['code'],
      ),
      Model(
        name: modelsList[1]['name'],
        code: modelsList[1]['code'],
      ),
    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClientMock.mockGet([{ 'invalid_key': 'invalid_data' }]);
    final future = systemUnderTest.load(brand);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClientMock.mockGetError(HttpError.serverError);
    final future = systemUnderTest.load(brand);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw NotFoundError if HttpClient returns 404', () async {
    httpClientMock.mockGetError(HttpError.notFound);
    final future = systemUnderTest.load(brand);
    expect(future, throwsA(DomainError.notFound));
  });
}
