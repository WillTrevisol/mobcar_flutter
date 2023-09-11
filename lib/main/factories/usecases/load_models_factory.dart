import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/usecases/usecases.dart';
import 'package:mobcar/main/factories/http/http.dart';

LoadModels remoteLoadModelsFactory() {
  return RemoteLoadModels(
    httpClient: httpClientFactory(),
    url: apiUrlFactory,
  );
}
