import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {
  ClientMock() {
    mockGet(200);
  }

  When mockGetCall() => when(() => this.get(any(), headers: any(named: 'headers')));
  void mockGet(int statusCode, {String body = '{"key":"value"}'}) => mockGetCall().thenAnswer((_) async => Response(body, statusCode));
  void mockGetError() => mockGetCall().thenThrow(Exception());
}
