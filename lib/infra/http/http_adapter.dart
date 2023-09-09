import 'package:http/http.dart';

import 'package:mobcar/data/http/http.dart';

class HttpAdapter implements HttpClient {
  HttpAdapter({required this.client});

  final Client client;

  @override
  Future get({required String url, Map<String, dynamic>? headers}) async {
    Response response = Response('', 500);
    try {
      response = await client.get(Uri.parse(url), headers: {'content-type': 'application/json'});
    } catch (error) {
      throw HttpError.serverError;
    }
    return HttpResponseAdapter.get(key: response.statusCode, data: response.body);
  }

}
