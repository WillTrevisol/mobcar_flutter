import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:mobcar/ui/pages/pages.dart';
import 'package:mobcar/ui/mixins/mixins.dart';
import 'package:mobcar/ui/components/components.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.presenter});

  final DashboardPresenter presenter;
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with LoadingManager {

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: DefaultAppBar.appBar(context),
      bottomNavigationBar: const DefaultBottomBar(),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);

          SchedulerBinding.instance.addPostFrameCallback((_) async {
            await widget.presenter.loadFipeInfosData();
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Veículos salvos',
                      style: Theme.of(context).textTheme.titleLarge,
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
              const SizedBox(height: 10),
              StreamBuilder<List<FipeInfoViewEntity>?>(
                stream: widget.presenter.fipeInfosStream,
                builder: (context, snapshot) {
                  final fipeInfos = snapshot.data ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: fipeInfos.length,
                      itemBuilder: (context, index) {
                        return  VehicleTile(fipeInfoViewEntity: fipeInfos[index]);
                      },
                    ),
                  );
                },
              ),
            ]
          );
        },
      ),
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
