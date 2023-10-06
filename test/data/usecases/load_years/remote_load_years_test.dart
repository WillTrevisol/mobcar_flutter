import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/entities/entities.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  late HttpClientMock httpClientMock;
  late RemoteLoadYears systemUnderTest;
  late List<Map<String, dynamic>> yearsList;
  late String brand;
  late String model;
  late String url;

  setUp(() {
    url = faker.internet.httpUrl();
    brand = faker.vehicle.make();
    model = faker.vehicle.model();
    yearsList = ApiFactory.yearsList();
    httpClientMock = HttpClientMock();
    systemUnderTest = RemoteLoadYears(url: url, httpClient: httpClientMock);
    httpClientMock.mockGet(yearsList);
  });

  test('Should call HttpClient with correct values', () async {
    await systemUnderTest.load(brand: brand, model: model);

    verify(() => httpClientMock.get(url: '$url/$brand/models/$model/years')).called(1);
  });

  test('Should return list of Years on success', () async {
    final responseList = await systemUnderTest.load(brand: brand, model: model);

    expect(responseList, [
      Year(
        name: yearsList[0]['name'],
        code: yearsList[0]['code'],
      ),
      Year(
        name: yearsList[1]['name'],
        code: yearsList[1]['code'],
      ),
      Year(
        name: yearsList[2]['name'],
        code: yearsList[2]['code'],
      ),
      Year(
        name: yearsList[3]['name'],
        code: yearsList[3]['code'],
      ),
    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClientMock.mockGet([{ 'invalid_key': 'invalid_data' }]);
    final future = systemUnderTest.load(brand: brand, model: model);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClientMock.mockGetError(HttpError.serverError);
    final future = systemUnderTest.load(brand: brand, model: model);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw NotFoundError if HttpClient returns 404', () async {
    httpClientMock.mockGetError(HttpError.notFound);
    final future = systemUnderTest.load(brand: brand, model: model);
    expect(future, throwsA(DomainError.notFound));
  });
}
