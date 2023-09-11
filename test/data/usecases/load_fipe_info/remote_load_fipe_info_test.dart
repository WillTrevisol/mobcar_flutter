import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/data/usecases/usecases.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  
  late HttpClientMock httpClientMock;
  late RemoteLoadFipeInfo systemUnderTest;
  late Map<String, dynamic> fipeInfo;
  late String brand;
  late String model;
  late String year;
  late String url;

  setUp(() {
    url = faker.internet.httpUrl();
    brand = faker.vehicle.make();
    model = faker.vehicle.model();
    year = faker.vehicle.year();
    fipeInfo = ApiFactory.fipeInfo();
    httpClientMock = HttpClientMock();
    systemUnderTest = RemoteLoadFipeInfo(url: url, httpClient: httpClientMock);
    httpClientMock.mockGet(fipeInfo);
  });

  test('Should call HttpClient with correct values', () async {
    await systemUnderTest.load(brand: brand, model: model, year: year);

    verify(() => httpClientMock.get(url: '$url/brands/$brand/models/$model/years/$year')).called(1);
  });

  test('Should return FipeInfo on success', () async {
    final response = await systemUnderTest.load(brand: brand, model: model, year: year);

    expect(response,
      FipeInfo(
        price: fipeInfo['price'],
        brand: fipeInfo['brand'],
        model: fipeInfo['model'],
        modelYear: fipeInfo['modelYear'],
      ),
    );
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClientMock.mockGet([{ 'invalid_key': 'invalid_data' }]);
    final future = systemUnderTest.load(brand: brand, model: model, year: year);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClientMock.mockGetError(HttpError.serverError);
    final future = systemUnderTest.load(brand: brand, model: model, year: year);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw NotFoundError if HttpClient returns 404', () async {
    httpClientMock.mockGetError(HttpError.notFound);
    final future = systemUnderTest.load(brand: brand, model: model, year: year);
    expect(future, throwsA(DomainError.notFound));
  });
}
