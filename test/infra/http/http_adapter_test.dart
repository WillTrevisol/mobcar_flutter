import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/infra/http/http.dart';

import '../mocks/mocks.dart';

void main() {

  late HttpAdapter systemUnderTest;
  late ClientMock clientMock;
  late String url;
  late Uri uri;

  setUp(() {
    clientMock = ClientMock();
    systemUnderTest = HttpAdapter(client: clientMock);
    
  });

  setUpAll(() {
    url = faker.internet.uri('http');
    uri = Uri.parse(url);
    registerFallbackValue(uri);
  });

  test('Should call get with correct values', () async {
    await systemUnderTest.get(url: url, headers: {'content-type': 'application/json', 'accept': 'application/json'});

    verify(() => clientMock.get(uri, headers: {'content-type': 'application/json', 'accept': 'application/json'})).called(1);
  });

  test('Should return data if get returns 200', () async {
    final response = await systemUnderTest.get(url: url, headers: {'content-type': 'application/json'});

    expect(response, {"key":"value"});
  });

  test('Should return NotFoundError if get returns 404', () async {
    clientMock.mockGet(404);
    final future = systemUnderTest.get(url: url, headers: {'content-type': 'application/json'});

    expect(future, throwsA(HttpError.notFound));
  });
  
  test('Should return ServerError if get returns 500', () async {
    clientMock.mockGet(500);
    final future = systemUnderTest.get(url: url, headers: {'content-type': 'application/json'});

    expect(future, throwsA(HttpError.serverError));
  });
}
