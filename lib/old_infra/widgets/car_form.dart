import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../models/car_brand.dart';
import '../models/car_model.dart';
import '../models/car_year.dart';
import '../stores/car_store.dart';
import '../../ui/components/custom_elevated_button.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final CarStore controller = GetIt.I.get<CarStore>();
  final _formKey = GlobalKey<FormState>();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Observer(
          builder: (_) {
            if (controller.error != null) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    const Icon(
                      Icons.wifi_off,
                      size: 60,
                    ),
                    Text(
                      controller.error,

                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        controller.getBrands();
                        controller.clearFields();
                      }, 
                      widget: const Text('Tentar novamente'), 
                      color: Colors.black, 
                    ),
                  ],
                ),
              );
            }
            return Column(
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
                      icon: const Icon(Icons.close),
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
                      value: controller.carBrand,
                      items: controller.brands.map((CarBrand carBrand) {
                        return DropdownMenuItem(
                          value: carBrand,
                          child: Text('${carBrand.name}'),
                        );
                      }).toList(),
                      hint: const Text('Selecione uma marca'),
                      onChanged: (CarBrand? newValue) {
                        _setNewCarBrand(newValue);
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                Observer(
                  builder: (_) {
                    return DropdownButtonFormField<CarModel>(
                      validator: validator,
                      decoration: _inputDecoration(),
                      isExpanded: true,
                      value: controller.carModel,
                      items: controller.models.map((CarModel carModel) {
                        return DropdownMenuItem(
                          value: carModel,
                          child: Text('${carModel.name}'),
                        );
                      }).toList(),
                      hint: const Text('Selecione um modelo'),
                      onChanged: (CarModel? newValue) {
                        _setNewCarModel(newValue);
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                Observer(
                  builder: (_) {
                    return DropdownButtonFormField<CarYear>(
                      validator: validator,
                      decoration: _inputDecoration(),
                      isExpanded: true,
                      value: controller.carYear,
                      items: controller.years.map((CarYear carYear) {
                        return DropdownMenuItem(
                          value: carYear,
                          child: Text('${carYear.name}'),
                        );
                      }).toList(),
                      hint: const Text('Selecione um ano'),
                      onChanged: (CarYear? newValue) {
                        _setNewCarYear(newValue);
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      readOnly: true,
                      decoration:
                        _inputDecoration(text: 'Valor ${controller.carValue}'),
                    );
                  },
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
                      borderColor: Colors.black,
                      widget: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveNewCar(context);
                        }
                      },
                      color: Colors.black,
                      widget: controller.loading 
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Colors.white
                            )
                          )
                        : const Text('Salvar')
                    ),
                  ],
                ),
              ],
            );
          },
        )
      ),
    );
  }

  void _saveNewCar(BuildContext context) {
    controller.addCar();
    controller.saveList();
    controller.clearFields();
    Navigator.pop(context);
  }

  void _setNewCarYear(CarYear? newValue) {
    controller.setYearCode(newValue!.code);
    controller.setCarYear(newValue);
    controller.getCar();
  }

  void _setNewCarModel(CarModel? newValue) {
    controller.setModelCode(newValue!.code);
    controller.setCarModel(newValue);
    controller.getYears();
  }

  void _setNewCarBrand(CarBrand? newValue) {
    controller.setCarBrand(newValue);
    controller.setBrandCode(newValue!.code);
    controller.getModels();
  }

  String? validator(Object? value) {
    if (value == null) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
