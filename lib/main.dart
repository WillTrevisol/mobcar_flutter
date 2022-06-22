import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobcar/stores/car_store.dart';
import 'screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<CarStore>(CarStore());
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