import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/usecases/usecases.dart';
import 'package:mobcar/main/factories/http/http.dart';

LoadBrands remoteLoadBrandsFactory() {
  return RemoteLoadBrands(
    httpClient: httpClientFactory(),
    url: apiUrlFactory,
  );
}
