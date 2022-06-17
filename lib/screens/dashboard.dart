import 'package:flutter/material.dart';
import 'package:mobcar/stores/carlist_store.dart';
import 'package:mobcar/theme.dart';
import 'package:mobcar/widgets/custom_icon_button.dart';
import 'package:mobcar/widgets/custom_list_tile.dart';
import 'package:mobcar/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobcar/widgets/new_car_form.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  CarListStore carListStore = CarListStore();

  final List<String> _choices = [
    'Ver',
    'Editar',
    'Deletar',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      bottomNavigationBar: _bottomAppBar(),
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

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 12.0, left: 18.0),
          child: Text(
            'Digite um título para adicionar um item: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomTextField(
              hintText: 'Digite um título',
              prefix: const Icon(
                Icons.car_crash_outlined,
              ),
              suffix: CustomIconButton(
                onTap: carListStore.isButtonActive
                    ? () {
                        openNewItemDialog(context);
                      }
                    : null,
                icon: Icon(
                  Icons.send_and_archive_rounded,
                  color: carListStore.isButtonActive
                      ? MobCarColors.blueMob
                      : Colors.grey,
                ),
                radius: 32,
              ),
              onChanged: carListStore.setNewItemTitle,
              onSubmitted: (String text) {},
            ),
          );
        }),
        Expanded(
          child: ListView(
            children: [
              CustomListTile(
                iconData: Icons.car_crash,
                titleText: 'Title',
                year: 'Year',
                choices: _choices,
                onSelected: _onSelected,
                itemBuilder: (context) {
                  return _choices.map((String choice) {
                    return PopupMenuItem(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> openNewItemDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Dialog(child: NewCarForm()); 
      },
    );
  }

  void _onSelected(String choice) {
    switch (choice) {
      case 'Ver':
        print('Ver');
        break;
      case 'Editar':
        print('Editar');
        break;
      case 'Deletar':
        print('Deletar');
        break;
    }
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: MobCarColors.blackMob,
      leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ]),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu_open_outlined,
            color: MobCarColors.blueMob,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
