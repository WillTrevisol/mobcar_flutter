import 'package:http/http.dart';

import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/infra/http/http.dart';

HttpClient httpClientFactory() =>  HttpAdapter(client: Client());