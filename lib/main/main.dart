import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:mobcar/main/factories/factories.dart';
import 'package:mobcar/ui/components/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MobCar());
}

class MobCar extends StatelessWidget {
  const MobCar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobcar',
      theme: AppTheme.themeData,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: dashboardPageFactory),
      ],
    );
  }

}
