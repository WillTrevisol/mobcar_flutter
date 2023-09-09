import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/entities/entities.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class RemoteLoadBrands implements LoadBrands {
  const RemoteLoadBrands({required this.url, required this.httpClient});

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<Brand>> load() async {
    try {
      final response = await httpClient.get(url: url);
      return response.map<Brand>((brand) => RemoteBrand.fromMap(brand).toDomainEntity()).toList();
    } catch (error) {
      throw error == HttpError.notFound ? DomainError.notFound : DomainError.unexpected;
    }
  }

}
