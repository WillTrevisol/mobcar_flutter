import 'package:flutter/material.dart';
import 'package:mobcar/colors.dart';

import '../models/car.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.car}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobCarColors.blackMob,
      appBar: AppBar(
        title: Text('${car.brand}'),
        backgroundColor: MobCarColors.blackMob,
      ),
      body: Center(
        child: Hero(
          tag: car.toString(),
          child: Image.asset('assets/images/voyage-sedan.png')),
      ),
    );
  }
}