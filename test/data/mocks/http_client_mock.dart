import 'package:mocktail/mocktail.dart';

import 'package:mobcar/data/http/http.dart';

class HttpClientMock extends Mock implements HttpClient {

  When mockGetCall() => when(() => get(url: any(named: 'url'), headers: any(named: 'headers')));
  void mockGet(dynamic data) => mockGetCall().thenAnswer((_) async => data);
  void mockGetError(HttpError error) => mockGetCall().thenThrow(error);
}
