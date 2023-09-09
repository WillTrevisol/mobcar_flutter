import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/usecases/usecases.dart';
import 'package:mobcar/main/factories/http/http.dart';

LoadYears remoteLoadYearsFactory() {
  return RemoteLoadYears(
    httpClient: httpClientFactory(),
    url: apiUrlFactory,
  );
}
