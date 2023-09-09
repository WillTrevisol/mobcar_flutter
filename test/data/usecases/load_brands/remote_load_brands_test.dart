import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';

import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {

  late HttpClientMock httpClientMock;
  late RemoteLoadBrands systemUnderTest;
  late List<Map<String, dynamic>> brandsList;
  late String url;

  setUp(() {
    url = faker.internet.httpUrl();
    httpClientMock = HttpClientMock();
    brandsList = ApiFactory.brandsList();
    systemUnderTest = RemoteLoadBrands(url: url, httpClient: httpClientMock);
    httpClientMock.mockGet(brandsList);
  });

  test('Should call HttpClient with correct values', () async {
    await systemUnderTest.load();

    verify(() => httpClientMock.get(url: url)).called(1);
  });

  test('Should return list of Brands on success', () async {
    final responseList = await systemUnderTest.load();

    expect(responseList, [
      Brand(
        name: brandsList[0]['name'],
        code: brandsList[0]['code'],
      ),
      Brand(
        name: brandsList[1]['name'],
        code: brandsList[1]['code'],
      ),
      Brand(
        name: brandsList[2]['name'],
        code: brandsList[2]['code'],
      ),
    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClientMock.mockGet([{ 'invalid_key': 'invalid_data' }]);
    final future = systemUnderTest.load();
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClientMock.mockGetError(HttpError.serverError);
    final future = systemUnderTest.load();
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw NotFoundError if HttpClient returns 404', () async {
    httpClientMock.mockGetError(HttpError.notFound);
    final future = systemUnderTest.load();
    expect(future, throwsA(DomainError.notFound));
  });

}
