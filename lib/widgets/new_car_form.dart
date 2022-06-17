import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobcar/communication.dart/repository.dart';
import 'package:mobcar/models/car_model.dart';
import 'package:mobcar/models/car_year.dart';
import 'package:mobcar/stores/new_car_store.dart';

import '../models/car_brand.dart';

class NewCarForm extends StatefulWidget {
  const NewCarForm({Key? key}) : super(key: key);

  @override
  State<NewCarForm> createState() => _NewCarFormState();
}

class _NewCarFormState extends State<NewCarForm> {
  final _formKey = GlobalKey<FormState>();
  NewCarStore newCarStore = NewCarStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (newCarStore.brands.isEmpty) {
      getBrands();
    }
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DropdownButtonHideUnderline(
            child: Observer(
              builder: (_) {
                return DropdownButton<CarBrand>(
                  value: newCarStore.carBrand,
                  items: newCarStore.brands.map((CarBrand carBrand) {
                    return DropdownMenuItem(
                      value: carBrand,
                      child: Text(carBrand.name.toString()),
                    );
                  }).toList(),
                  hint: const Text('Selecione uma marca'),
                  onChanged: (CarBrand? newValue) {
                    newCarStore.setCarBrand(newValue);
                    newCarStore.setBrandCode(newValue!.code);
                    getModels();
                  }
                );
              }
            ),
          ),
          DropdownButtonHideUnderline(
            child: Observer(
              builder: (_) {
                return DropdownButton<CarModel>(
                  value: newCarStore.carModel,
                  items: newCarStore.models.map((CarModel carModel) {
                    return DropdownMenuItem(
                      value: carModel,
                      child: Text(carModel.name.toString()),
                    );
                  }).toList(),
                  hint: const Text('Selecione um modelo'),
                  onChanged: (CarModel? newValue) {
                    newCarStore.setModelCode(newValue!.code);
                    newCarStore.setCarModel(newValue);
                    getYears();
                  }
                );
              }
            ),
          ),
          DropdownButtonHideUnderline(
            child: Observer(
              builder: (_) {
                return DropdownButton<CarYear>(
                  value: newCarStore.carYear,
                  items: newCarStore.years.map((CarYear carYear) {
                    return DropdownMenuItem(
                      value: carYear,
                      child: Text(carYear.name.toString()),
                    );
                  }).toList(),
                  hint: const Text('Selecione um ano'),
                  onChanged: (CarYear? newValue) {
                    newCarStore.setYearCode(newValue!.code);
                    newCarStore.setCarYear(newValue);
                    getCar();
                  }
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getBrands() async {
    final data = await repository.getCarBrands();
    setState(() {
      newCarStore.addBrands(data);
    });
  }

  Future<void> getModels() async {
    final data =
        await repository.getCarModels(brandCode: newCarStore.brandCode);
    setState(() {
      newCarStore.addModels(data);
    });
  }

  Future<void> getYears() async {
    final data = await repository.getCarYears(
        brandCode: newCarStore.brandCode, modelCode: newCarStore.modelCode);
    setState(() {
      newCarStore.addYears(data);
    });
  }

  Future<void> getCar() async {
    final data = await repository.getCar(
      brandCode: newCarStore.brandCode,
      modelCode: newCarStore.modelCode,
      yearCode: newCarStore.yearCode);
    newCarStore.setCar(data);
    print(newCarStore.car);
  }
}
