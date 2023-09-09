import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:mobcar/old_infra/screens/image_screen.dart';
import 'package:mobcar/old_infra/widgets/custom_elevated_button.dart';

import '../models/car.dart';
import '../stores/car_store.dart';
import 'car_details.dart';

class CarListTile extends StatelessWidget {

  CarListTile({Key? key, required this.car}) : super(key: key);

  final Car car;
  final carStore = GetIt.I.get<CarStore>();
  final List<String> _choices = [
    'Ver',
    'Deletar',
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        child: Hero(
          tag: car.toString(),
          child: Image.asset('assets/images/voyage-sedan.png'),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen(car: car))),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${car.model}',
            style: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${car.year}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: () {
              showCarDetails(context, car);
            }, 
            child: const Text('Ver mais')
          ),
        ],
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (choice) {
          switch (choice) {
            case 'Ver':
              showCarDetails(context, car);
              break;
            case 'Deletar':
              showDeleteDialog(context, car);
              break;
          }
        },
        itemBuilder: ((context) => _choices.map((e) {
          return PopupMenuItem(
            value: e,
            child: Text(e),
          );
          }).toList() 
        ),
      )
    );
  }

  Future<void> showCarDetails(BuildContext context, Car car) {
    return showDialog(context: context, builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      child: CarDetails(car: car)
      ),
    );
  }

  Future<void> showDeleteDialog(BuildContext context, Car car) {
    return showDialog(
      context: context, builder: (context) => AlertDialog(
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
          'Você deseja a deletar o carro modelo: \n ${car.model} ?',
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
            onPressed: () => carStore.removeCar(car).then((value) => Navigator.of(context).pop()), 
            widget: const Text(
              'Confirmar'
            ), 
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}