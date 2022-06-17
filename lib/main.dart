import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() async {
  runApp(const MobCar());
}

class MobCar extends StatelessWidget {
  const MobCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }

}