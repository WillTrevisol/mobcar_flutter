import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../communication.dart/repository.dart';
import '../models/car_brand.dart';
import '../models/car_model.dart';
import '../models/car_year.dart';
import '../stores/car_store.dart';
import 'custom_elevated_button.dart';

class CarForm extends StatefulWidget {

  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final carStore = GetIt.I.get<CarStore>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  InputDecoration _inputDecoration({String? text}) {
    return InputDecoration(
      hintText: text ?? '',
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  } 

  @override
  void initState() {
    getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const FaIcon(FontAwesomeIcons.car),
                const Text(
                  'Novo carro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)
                ),
              ],
            ),
            const SizedBox(height: 20),
            Observer( 
              builder: (_) {
                return DropdownButtonFormField<CarBrand>(
                  validator: validator,
                  decoration: _inputDecoration(),
                  isExpanded: true,
                  value: carStore.carBrand,
                  items: carStore.brands.map((CarBrand carBrand) {
                    return DropdownMenuItem(
                      value: carBrand,
                      child: Text('${carBrand.name}'),
                    );
                  }).toList(),
                  hint: const Text('Selecione uma marca'),
                  onChanged: (CarBrand? newValue) {
                    carStore.setCarBrand(newValue);
                    carStore.setBrandCode(newValue!.code);
                    textEditingController.clear();
                    getModels();
                  }
                );
              }
            ),
            const SizedBox(height: 12),
            Observer(
              builder: (_) {
                return DropdownButtonFormField<CarModel>(
                  validator: validator,
                  decoration: _inputDecoration(),
                  isExpanded: true,
                  value: carStore.carModel,
                  items: carStore.models.map((CarModel carModel) {
                    return DropdownMenuItem(
                      value: carModel,
                      child: Text('${carModel.name}'),
                    );
                  }).toList(),
                  hint: const Text('Selecione um modelo'),
                  onChanged: (CarModel? newValue) {
                    carStore.setModelCode(newValue!.code);
                    carStore.setCarModel(newValue);
                    textEditingController.clear();
                    getYears();
                  }
                );
              }
            ),
            const SizedBox(height: 12),
            Observer(
              builder: (_) {
                return DropdownButtonFormField<CarYear>(
                  validator: validator,
                  decoration: _inputDecoration(),
                  isExpanded: true,
                  value: carStore.carYear,
                  items: carStore.years.map((CarYear carYear) {
                    return DropdownMenuItem(
                      value: carYear,
                      child: Text('${carYear.name}'),
                    );
                  }).toList(),
                  hint: const Text('Selecione um ano'),
                  onChanged: (CarYear? newValue) {
                    carStore.setYearCode(newValue!.code);
                    carStore.setCarYear(newValue);
                    getCar();
                  }
                );
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: textEditingController,
              readOnly: true,
              decoration: _inputDecoration(text: 'Valor '),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: 'Cancelar',
                ),
                const SizedBox(width: 12),
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      carStore.addCar();
                      carStore.saveList();
                      carStore.clearFields();
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  text: 'Salvar',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getBrands() async {
    final data = await repository.getCarBrands();
    carStore.addBrands(data);
  }

  Future<void> getModels() async {
    final data =
      await repository.getCarModels(brandCode: carStore.brandCode);
    carStore.addModels(data);
  }

  Future<void> getYears() async {
    final data = await repository.getCarYears(
      brandCode: carStore.brandCode, 
      modelCode: carStore.modelCode);
    carStore.addYears(data);
  }

  Future<void> getCar() async {
    final data = await repository.getCar(
      brandCode: carStore.brandCode,
      modelCode: carStore.modelCode,
      yearCode: carStore.yearCode);
    carStore.setCar(data);

    textEditingController.text = carStore.car!.value.toString(); 
  }

  String? validator(Object? value) {
    if (value == null) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
