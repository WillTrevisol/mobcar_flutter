import 'package:mobcar/main/factories/usecases/usecases.dart';
import 'package:mobcar/presentation/presenters/presenters.dart';
import 'package:mobcar/ui/pages/pages.dart';

DashboardPresenter getxDashboardPresenterFactory() {
  return GetxDashboardPresenter(
    loadBrands: remoteLoadBrandsFactory(),
    loadModels: remoteLoadModelsFactory(),
    loadYears: remoteLoadYearsFactory(),
    loadFipeInfo: remoteLoadFipeInfoFactory(),
  );
}
