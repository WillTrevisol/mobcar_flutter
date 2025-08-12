import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:mobcar/ui/components/components.dart';
import 'package:mobcar/ui/pages/dashboard/dashboard.dart';

class VehicleDeleteDialog extends StatelessWidget {
  const VehicleDeleteDialog({super.key, required this.fipeInfo});

  final FipeInfoViewEntity fipeInfo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const FaIcon(FontAwesomeIcons.car),
          const Text(
            'ATENÇÃO',
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
      content: Text(
        'Você deseja a deletar o veículo modelo: \n ${fipeInfo.model}?',
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actions: [
        CustomElevatedButton(
          onPressed: () => Navigator.of(context).pop(), 
          widget: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.black,
            ),
          ), 
          color: Colors.white, 
          borderColor: Colors.black,
        ),
        CustomElevatedButton(
          onPressed: () => Get.find<DashboardPresenter>().delete(fipeInfo).then((value) => Navigator.of(context).pop()), 
          widget: const Text(
            'Confirmar'
          ), 
          color: Colors.black,
        ),
      ],
    );
  }
}