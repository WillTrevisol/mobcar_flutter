import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobcar/old_infra/colors.dart';
import 'package:mobcar/old_infra/stores/car_store.dart';
import 'package:mobcar/old_infra/widgets/car_form.dart';
import 'package:mobcar/old_infra/widgets/car_list_tile.dart';
import 'package:mobcar/old_infra/widgets/custom_elevated_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final carStore = GetIt.I.get<CarStore>();

  @override
  void initState() {
    carStore.getCarsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                'Veículos salvos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              CustomElevatedButton(
                onPressed: () => openNewCarDialog(context),
                widget: const Text('Adicionar'),
                color: Colors.black,
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black, indent: 2, endIndent: 2),
        Expanded(
          child: Observer(
            builder: (_) {
              return carStore.cars.isNotEmpty ? ListView.separated(
                itemBuilder: (BuildContext context, int index) => 
                  CarListTile(car: carStore.cars[index]),
                separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.black, indent: 12, endIndent: 12),
                itemCount: carStore.cars.length,
              ) : const Center(child: Text('Nenhum veículo cadastrado.', style: TextStyle(fontSize: 18)));
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
          child: const CarForm(),
        );
      },
    );
  }
}
