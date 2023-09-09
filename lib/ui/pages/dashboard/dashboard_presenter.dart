import 'package:mobcar/ui/pages/dashboard/entities/entities.dart';

abstract class DashboardPresenter {
  Stream<bool> get isLoadingStream;
  Stream<BrandViewEntity?> get brandStream;
  Stream<ModelViewEntity?> get modelStream;
  Stream<YearViewEntity?> get yearStream;
  Stream<FipeInfoViewEntity> get fipeInfoStream;

  Future<void> loadBrands();
  Future<void> loadModels();
  Future<void> loadYears();
  Future<void> loadFipeInfo();
  Future<void> save();

  void dispose();
}
