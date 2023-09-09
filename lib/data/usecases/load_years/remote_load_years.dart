import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/data/entities/remote_year.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/entities/entities.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class RemoteLoadYears implements LoadYears {
  const RemoteLoadYears({required this.httpClient, required this.url});

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<Year>> load({required String brand, required String model}) async {
    try {
      final response = await httpClient.get(url: '$url/brands/$brand/models/$model/years');
      return response.map<Year>((year) => RemoteYear.fromMap(year).toDomainEntity()).toList();
    } catch (error) {
      throw error == HttpError.notFound ? DomainError.notFound : DomainError.unexpected;
    }
  }

}
