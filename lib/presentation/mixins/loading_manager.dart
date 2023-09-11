import 'package:get/get_rx/get_rx.dart';

mixin LoadingManager {
  final _isLoadingController = Rx<bool>(false);
  Stream<bool> get isLoading => _isLoadingController.stream;
  set setIsLoading(bool value) => _isLoadingController.value = value;

  void disposeIsLoading() {
    _isLoadingController.close();
  }
}
