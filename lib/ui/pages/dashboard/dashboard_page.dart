import 'package:flutter/material.dart';

import 'package:mobcar/ui/pages/pages.dart';
import 'package:mobcar/ui/components/components.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBar(context),
      body: _body(context),
      bottomNavigationBar: const DefaultBottomBar(),
    );
  }

  Widget _body(BuildContext context) {
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
                onPressed: () => openVehicleForm(context),
                widget: const Text('Adicionar'),
                color: Colors.black,
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black, indent: 2, endIndent: 2),
      ]
    );
  }

  Future<void> openVehicleForm(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const VehicleForm(),
        );
      },
    );
  }
}
