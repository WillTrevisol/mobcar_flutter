import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/entities/entities.dart';
import 'package:mobcar/domain/entities/model.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/usecases/load_models.dart';

class RemoteLoadModels implements LoadModels {
  const RemoteLoadModels({required this.url, required this.httpClient});

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<Model>> load() async {
    try {
      final response = await httpClient.get(url: url);
      return response.map<Model>((model) => RemoteModel.fromMap(model).toDomainEntity()).toList();
    } catch (error) {
      throw error == HttpError.notFound ? DomainError.notFound : DomainError.unexpected;
    }
  }

}
