import 'package:flutter/material.dart';
import 'package:mobcar/ui/components/app_theme.dart';

import '../models/car.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.car}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackMob,
      appBar: AppBar(
        title: Text('${car.brand}'),
        backgroundColor: AppTheme.blackMob,
      ),
      body: Center(
        child: Hero(
          tag: car.toString(),
          child: Image.asset('assets/images/voyage-sedan.png')),
      ),
    );
  }
}
