import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/brand.dart';

final requests = _Resquests();

class _Resquests {

  var url = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas');

  Future<List<Brand>> getBrands() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonDedoded = jsonDecode(response.body);
      List<Brand> brands = [];

      jsonDedoded.forEach(
        (Map<String, dynamic> item)  {
          brands.add(Brand.fromJson(item));
        },
      );

      return brands;
    } else {
      throw(Exception('Request error.'));
    }
  }
}