import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/entities/entities.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class RemoteLoadModels implements LoadModels {
  const RemoteLoadModels({required this.url, required this.httpClient});

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<Model>> load(String brand) async {
    try {
      final response = await httpClient.get(url: '$url/brands/$brand/models');
      return response.map<Model>((model) => RemoteModel.fromMap(model).toDomainEntity()).toList();
    } catch (error) {
      throw error == HttpError.notFound ? DomainError.notFound : DomainError.unexpected;
    }
  }

}
