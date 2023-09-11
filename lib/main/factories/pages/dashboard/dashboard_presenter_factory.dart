import 'package:mobcar/main/factories/usecases/load_fipe_infos_factory.dart';
import 'package:mobcar/main/factories/usecases/usecases.dart';
import 'package:mobcar/presentation/presenters/presenters.dart';
import 'package:mobcar/ui/pages/pages.dart';

DashboardPresenter getxDashboardPresenterFactory() {
  return GetxDashboardPresenter(
    loadBrands: remoteLoadBrandsFactory(),
    loadModels: remoteLoadModelsFactory(),
    loadYears: remoteLoadYearsFactory(),
    loadFipeInfo: remoteLoadFipeInfoFactory(),
    saveFipeInfo: localSaveFipeInfoFactory(),
    loadFipeInfos: localLoadFipeInfosFactory(),
  );
}
