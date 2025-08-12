import 'package:flutter/material.dart';

import 'package:mobcar/ui/pages/pages.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({super.key, required this.fipeInfoViewEntity});

  final FipeInfoViewEntity fipeInfoViewEntity;

  @override
  Widget build(BuildContext context) {
    final popupChoices = ['Ver mais', 'Deletar'];
    return ListTile(
      leading: Image.asset(
        'assets/images/${fipeInfoViewEntity.brand}.png',
        width: MediaQuery.of(context).size.width * 0.2,
        scale: 1,
        errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/VW - VolksWagen.png'),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            fipeInfoViewEntity.model,
            style: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            fipeInfoViewEntity.modelYear.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: () => showDetailsDialog(context), 
            child: const Text('Ver mais')
          ),
        ],
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (choice) {
          switch (choice) {
            case 'Deletar':
              showDeleteDialog(context);
              break;
            case 'Ver mais':
              showDetailsDialog(context);
              break;
          }
        },
        itemBuilder: ((context) => popupChoices.map((choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
          );
          }).toList() 
        ),
      ),
    );
  }

  Future<void> showDeleteDialog(BuildContext context) async {
    return await showDialog(
      context: context, builder: (context) => VehicleDeleteDialog(
        fipeInfo: fipeInfoViewEntity,
      ),
    );
  }

  Future<void> showDetailsDialog(BuildContext context) async {
    return await showDialog(
      context: context, builder: (context) => VehicleDetailsDialog(
        fipeInfo: fipeInfoViewEntity,
      ),
    );
  }
}
