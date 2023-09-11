import 'package:flutter/material.dart';

import 'package:mobcar/ui/pages/pages.dart';

class VehicleTile extends StatelessWidget {
  const VehicleTile({Key? key, required this.fipeInfoViewEntity}) : super(key: key);

  final FipeInfoViewEntity fipeInfoViewEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/voyage-sedan.png'),
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
            onPressed: () {}, 
            child: const Text('Ver mais')
          ),
        ],
      ),
    );
  }
}
