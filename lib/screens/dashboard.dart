import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobcar/colors.dart';
import 'package:mobcar/stores/car_store.dart';
import 'package:mobcar/widgets/car_list_tile.dart';
import 'package:mobcar/widgets/custom_elevated_button.dart';
import 'package:mobcar/widgets/new_car_form.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  CarStore carStore = CarStore();

  @override
  Widget build(BuildContext context) {

    if (carStore.cars.isEmpty) { 
      carStore.getCarsList();
    }

    return Scaffold(
      appBar: _appBar(),
      body: _body(context, carStore),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: MobCarColors.blackMob,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.blur_circular_outlined,
            color: MobCarColors.blueMob,
          ),
          Text(
            'MOBCAR',
            style: TextStyle(
              color: MobCarColors.blueMob,
              fontWeight: FontWeight.w100,
              fontSize: 12,
            ),
          ),
        ]
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu_open_outlined,
            color: MobCarColors.blueMob,
          ),
          onPressed: () {
          },
        ),
      ],
    );
  }

  Widget _body(BuildContext context, CarStore carStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Carros salvos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              CustomElevatedButton(
                onPressed: () => openNewCarDialog(context),
                text: 'Adicionar',
                color: Colors.black,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: Observer(
            builder: (_) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) => 
                  CarListTile(car: carStore.cars[index], carStore: carStore),
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: carStore.cars.length,
              );
            }
          ),
        ),
      ]
    );
  }

  Widget _bottomAppBar() {
    return SizedBox(
      height: 35,
      child: BottomAppBar(
        elevation: 0,
        color: MobCarColors.blackMob,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            '© 2020. All rights reserved to Mobcar.',
            style: TextStyle(color: MobCarColors.blueMob, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<dynamic> openNewCarDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: NewCarForm(carStore: carStore),
        );
      },
    );
  }
}
