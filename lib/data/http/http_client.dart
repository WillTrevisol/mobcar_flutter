abstract class HttpClient {
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? headers,
  });
}
