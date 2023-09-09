import 'package:mobcar/data/usecases/usecases.dart';
import 'package:mobcar/domain/usecases/usecases.dart';
import 'package:mobcar/main/factories/http/http.dart';

LoadFipeInfo remoteLoadFipeInfoFactory() {
  return RemoteLoadFipeInfo(
    httpClient: httpClientFactory(),
    url: apiUrlFactory,
  );
}
