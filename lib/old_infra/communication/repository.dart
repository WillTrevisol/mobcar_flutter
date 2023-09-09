import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/car.dart';
import '../models/car_brand.dart';
import '../models/car_model.dart';
import '../models/car_year.dart';

class Repository {

  final brandUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas');

  Future<List<CarBrand>> getCarBrands() async {
    
    try {
      final response = await http.get(brandUrl);
      final jsonDecoded = jsonDecode(response.body);

      return (jsonDecoded as List).map((data) => CarBrand.fromJson(data)).toList();
    } catch (e) {
      return Future.error('Falha ao obter marcas.');
    }
  }

  Future<List<CarModel>> getCarModels({required brandCode}) async {

    try {
      final modelUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas/$brandCode/modelos');
      final response = await http.get(modelUrl);
      final jsonDecoded = jsonDecode(response.body);

      return (jsonDecoded['modelos'] as List).map((data) => CarModel.fromJson(data)).toList();
    } catch (e) {
      return Future.error('Falha ao obter modelos.');
    }
  }

  Future<List<CarYear>> getCarYears({required brandCode,required modelCode}) async {

    try {
      final yearUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas/$brandCode/modelos/$modelCode/anos');
      final response = await http.get(yearUrl);
      final jsonDecoded = jsonDecode(response.body);

      return (jsonDecoded as List).map((data) => CarYear.fromJson(data)).toList();
    } catch (e) {
      return Future.error('Falha ao obter anos.');
    }
  }

  Future<Car> getCar({required brandCode, required modelCode, required yearCode}) async {
    
    try {
      final carUrl = Uri.https('parallelum.com.br', '/fipe/api/v1/carros/marcas/$brandCode/modelos/$modelCode/anos/$yearCode');
      final response = await http.get(carUrl);
      final jsonDecoded = jsonDecode(response.body);
      
      return Car.fromJson(jsonDecoded);
    } catch (e) {
      return Future.error('Falha ao obter carro.');
    }
  }
}