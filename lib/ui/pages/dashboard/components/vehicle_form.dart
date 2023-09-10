import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobcar/ui/components/components.dart';
import 'package:mobcar/ui/pages/pages.dart';

class VehicleForm extends StatelessWidget {
  const VehicleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<DashboardPresenter>(context);
    return Builder(
      builder: (context) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          presenter.loadBrandsData();
        });

        return Form(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const FaIcon(FontAwesomeIcons.car),
                    Text(
                      'Novo carro',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                StreamBuilder<List<BrandViewEntity>?>(
                  stream: presenter.brandStream,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return DropdownFormMenu<BrandViewEntity>(
                      hintText: 'Marca',
                      itemsLabel: (BrandViewEntity value) => value.name,
                      onChanged: (BrandViewEntity? value) {
                        if (value != null) {
                          presenter.setBrand(value);
                          presenter.loadModelsData();
                        }
                      },
                      items: snapshot.data,
                    );
                  },
                ),
                const SizedBox(height: 12),
                StreamBuilder<List<ModelViewEntity>?>(
                  stream: presenter.modelStream,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return DropdownFormMenu<ModelViewEntity>(
                      hintText: 'Modelo',
                      itemsLabel: (ModelViewEntity value) => value.name,
                      onChanged: (ModelViewEntity? value) {
                        if (value != null) {
                          presenter.setModel(value);
                          presenter.loadYearsData();
                        }
                      },
                      items: snapshot.data,
                    );
                  },
                ),
                const SizedBox(height: 12),
                StreamBuilder<List<YearViewEntity>?>(
                  stream: presenter.yearStream,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return DropdownFormMenu<YearViewEntity>(
                      hintText: 'Ano',
                      itemsLabel: (YearViewEntity value) => value.name,
                      onChanged: (YearViewEntity? value) {
                        if (value != null) {
                          presenter.setYear(value);
                          presenter.loadFipeInfoData();
                        }
                      },
                      items: snapshot.data,
                    );
                  },
                ),
                const SizedBox(height: 12),
                StreamBuilder<FipeInfoViewEntity?>(
                  stream: presenter.fipeInfoStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: snapshot.data?.price ?? 'Valor',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        )
                      ),
                    );
                  }
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.white,
                      borderColor: Colors.black,
                      widget: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    CustomElevatedButton(
                      onPressed: () {},
                      color: Colors.black,
                      widget: const Text('Salvar')
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
