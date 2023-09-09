import 'dart:convert';

import 'package:mobcar/data/http/http.dart';

class HttpResponseAdapter {

  static final Map<int, dynamic> _adapter = {
    200: (data) => data.isNotEmpty ? jsonDecode(data) : null,
    404: (_) => throw HttpError.notFound,
    500: (_) => throw HttpError.serverError,
  };

  static dynamic get({required int key, dynamic data}) {
    return _adapter.containsKey(key) ? _adapter[key](data) : _adapter[500](data); 
  }
}
