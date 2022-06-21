import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobcar/widgets/custom_elevated_button.dart';

import '../models/car.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key, required this.car}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const FaIcon(FontAwesomeIcons.car),
              Text(
                car.brand.toString(),
                style: const TextStyle(
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
          Image.asset('assets/images/voyage-sedan.png', scale: 2),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  const Text('Marca', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(car.brand.toString(), style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 20),
                  const Text('Modelo', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(car.model.toString(), style: const TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  const Text('Ano', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(car.year.toString(), style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 20),
                  const Text('Valor', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(car.value.toString(), style: const TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              text: 'Reservar', 
              color: Colors.black, 
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}