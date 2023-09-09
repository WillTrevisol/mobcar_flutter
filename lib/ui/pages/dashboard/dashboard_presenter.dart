import 'package:flutter/material.dart';
import 'package:mobcar/ui/pages/dashboard/entities/entities.dart';

abstract class DashboardPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<BrandViewEntity>?> get brandStream;
  Stream<List<ModelViewEntity>?> get modelStream;
  Stream<List<YearViewEntity>?> get yearStream;
  Stream<FipeInfoViewEntity?> get fipeInfoStream;

  BrandViewEntity? get brand;
  ModelViewEntity? get model;
  YearViewEntity? get year;
  FipeInfoViewEntity? get fipeInfo;

  void setBrand(BrandViewEntity? value);
  void setModel(ModelViewEntity? value);
  void setYear(YearViewEntity? value);
  void setFipeInfo(FipeInfoViewEntity? value);

  Future<void> loadBrandsData();
  Future<void> loadModelsData();
  Future<void> loadYearsData();
  Future<void> loadFipeInfoData();
  Future<void> save();

  void dispose();
}
