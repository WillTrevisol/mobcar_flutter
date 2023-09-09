import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobcar/ui/components/components.dart';

import '../models/car.dart';

class CarDetails extends StatelessWidget {
  CarDetails({Key? key, required this.car}) : super(key: key);

  final Car car;
  final List<Widget> stars = [
    Icon(Icons.star, color: AppTheme.yellowMob),
    Icon(Icons.star, color: AppTheme.yellowMob),
    Icon(Icons.star, color: AppTheme.yellowMob),
    Icon(Icons.star, color: AppTheme.yellowMob),
    Icon(Icons.star, color: AppTheme.yellowMob)
  ];

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
                '${car.brand}',
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
          Stack(
            children: [
              Image.asset('assets/images/voyage-sedan.png', scale: 2),
              Row(
                children: stars,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  const Text('Marca', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${car.brand}', style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 20),
                  const Text('Modelo', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${car.model}', style: const TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  const Text('Ano', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${car.year}', style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 20),
                  const Text('Valor', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${car.value}', style: const TextStyle(fontSize: 12)),
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
              widget: const Text(
                'Reservar'
              ), 
              color: Colors.black, 
            ),
          ),
        ],
      ),
    );
  }
}