import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/car.dart';
import '../models/car_brand.dart';
import '../models/car_model.dart';
import '../models/car_year.dart';

final repository = _Repository();

class _Repository {

  final brandUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas');

  Future<List<CarBrand>> getCarBrands() async {
    
    final response = await http.get(brandUrl);
    final jsonDecoded = jsonDecode(response.body);

    return (jsonDecoded as List).map((data) => CarBrand.fromJson(data)).toList();
  }

  Future<List<CarModel>> getCarModels({required brandCode}) async {

    final modelUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas/$brandCode/modelos');
    final response = await http.get(modelUrl);
    final jsonDecoded = jsonDecode(response.body);

    return (jsonDecoded['modelos'] as List).map((data) => CarModel.fromJson(data)).toList();
  }

  Future<List<CarYear>> getCarYears({required brandCode,required modelCode}) async {

    final yearUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas/$brandCode/modelos/$modelCode/anos');
    final response = await http.get(yearUrl);
    final jsonDecoded = jsonDecode(response.body);

    return (jsonDecoded as List).map((data) => CarYear.fromJson(data)).toList();
  }

  Future<Car> getCar({required brandCode, required modelCode, required yearCode}) async {
    
    final carUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas/$brandCode/modelos/$modelCode/anos/$yearCode');
    final response = await http.get(carUrl);
    final jsonDecoded = jsonDecode(response.body);
    
    return Car.fromJson(jsonDecoded);
  }
}