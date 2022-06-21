import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../communication.dart/repository.dart';
import '../models/car_brand.dart';
import '../models/car_model.dart';
import '../models/car_year.dart';
import '../stores/car_store.dart';
import 'custom_elevated_button.dart';

class NewCarForm extends StatefulWidget {

  const NewCarForm({Key? key, required this.carStore}) : super(key: key);

  final CarStore carStore;

  @override
  State<NewCarForm> createState() => _NewCarFormState();
}

class _NewCarFormState extends State<NewCarForm> {
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
                  decoration: _inputDecoration(),
                  isExpanded: true,
                  value: widget.carStore.carBrand,
                  items: widget.carStore.brands.map((CarBrand carBrand) {
                    return DropdownMenuItem(
                      value: carBrand,
                      child: Text(carBrand.name.toString()),
                    );
                  }).toList(),
                  hint: const Text('Selecione uma marca'),
                  onChanged: (CarBrand? newValue) {
                    widget.carStore.setCarBrand(newValue);
                    widget.carStore.setBrandCode(newValue!.code);
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
                  decoration: _inputDecoration(),
                  isExpanded: true,
                  value: widget.carStore.carModel,
                  items: widget.carStore.models.map((CarModel carModel) {
                    return DropdownMenuItem(
                      value: carModel,
                      child: Text(carModel.name.toString()),
                    );
                  }).toList(),
                  hint: const Text('Selecione um modelo'),
                  onChanged: (CarModel? newValue) {
                    widget.carStore.setModelCode(newValue!.code);
                    widget.carStore.setCarModel(newValue);
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
                  decoration: _inputDecoration(),
                  isExpanded: true,
                  value: widget.carStore.carYear,
                  items: widget.carStore.years.map((CarYear carYear) {
                    return DropdownMenuItem(
                      value: carYear,
                      child: Text(carYear.name.toString()),
                    );
                  }).toList(),
                  hint: const Text('Selecione um ano'),
                  onChanged: (CarYear? newValue) {
                    widget.carStore.setYearCode(newValue!.code);
                    widget.carStore.setCarYear(newValue);
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
                    widget.carStore.addCar();
                    widget.carStore.saveList();
                    widget.carStore.clearFields();
                    Navigator.pop(context);
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
    widget.carStore.addBrands(data);
  }

  Future<void> getModels() async {
    final data =
      await repository.getCarModels(brandCode: widget.carStore.brandCode);
    widget.carStore.addModels(data);
  }

  Future<void> getYears() async {
    final data = await repository.getCarYears(
      brandCode: widget.carStore.brandCode, 
      modelCode: widget.carStore.modelCode);
    widget.carStore.addYears(data);
  }

  Future<void> getCar() async {
    final data = await repository.getCar(
      brandCode: widget.carStore.brandCode,
      modelCode: widget.carStore.modelCode,
      yearCode: widget.carStore.yearCode);
    widget.carStore.setCar(data);

    textEditingController.text = widget.carStore.car!.value.toString(); 
  }
}
