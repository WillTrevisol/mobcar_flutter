import 'package:mobcar/data/entities/remote_brand.dart';
import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/domain/entities/brand.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/usecases/load_brands.dart';

class RemoteLoadBrands implements LoadBrands {
  RemoteLoadBrands({required this.url, required this.httpClient});

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
