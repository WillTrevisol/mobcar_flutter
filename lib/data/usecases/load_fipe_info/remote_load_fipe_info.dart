import 'package:mobcar/data/entities/remote_fipe_info.dart';
import 'package:mobcar/data/http/http.dart';
import 'package:mobcar/domain/entities/fipe_info.dart';
import 'package:mobcar/domain/helpers/helpers.dart';
import 'package:mobcar/domain/usecases/usecases.dart';

class RemoteLoadFipeInfo implements LoadFipeInfo {
  const RemoteLoadFipeInfo({required this.url, required this.httpClient});

  final String url;
  final HttpClient httpClient;
  
  @override
  Future<FipeInfo> load({required String brand, required String model, required String year}) async {
    try {
      final response = await httpClient.get(url: '$url/brands/$brand/models/$model/years/$year');
      return RemoteFipeInfo.fromMap(response).toDomainEntity();
    } catch (error) {
      throw error == HttpError.notFound ? DomainError.notFound : DomainError.unexpected; 
    }
  }

}
