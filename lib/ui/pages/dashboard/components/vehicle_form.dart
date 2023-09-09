import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobcar/ui/components/components.dart';
import 'package:mobcar/ui/pages/pages.dart';
import 'package:provider/provider.dart';

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
                    const Text(
                      'Novo carro',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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
                    return DropdownSearch<BrandViewEntity>(
                      filterFn: (item, filter) {
                        return item.toString().toLowerCase().contains(filter.toLowerCase());
                      },
                      popupProps: const PopupProps.menu(
                        fit: FlexFit.tight,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            isDense: true,
                          ),
                        ),
                        searchDelay: Duration(seconds: 0),
                      ),
                      itemAsString: (BrandViewEntity item) => item.name,
                      onChanged: (BrandViewEntity? value) {
                        if (value != null) {
                          presenter.setBrand(value);
                          presenter.loadModelsData();
                        }
                      },
                      items: snapshot.data ?? [],
                    );
                  },
                ),
                const SizedBox(height: 12),
                StreamBuilder<List<ModelViewEntity>?>(
                  stream: presenter.modelStream,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return DropdownSearch<ModelViewEntity>(
                      filterFn: (item, filter) {
                        return item.toString().toLowerCase().contains(filter.toLowerCase());
                      },
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        searchDelay: Duration(seconds: 0),
                      ),
                      itemAsString: (ModelViewEntity item) => item.name,
                      onChanged: (ModelViewEntity? value) {
                        if (value != null) {
                          presenter.setModel(value);
                          presenter.loadYearsData();
                        }
                      },
                      items: snapshot.data ?? [],
                    );
                  },
                ),
                const SizedBox(height: 12),
                StreamBuilder<List<YearViewEntity>?>(
                  stream: presenter.yearStream,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return DropdownSearch<YearViewEntity>(
                      filterFn: (item, filter) {
                        return item.toString().toLowerCase().contains(filter.toLowerCase());
                      },
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        searchDelay: Duration(seconds: 0),
                      ),
                      itemAsString: (YearViewEntity item) => item.name,
                      onChanged: (YearViewEntity? value) {
                        if (value != null) {
                          presenter.setYear(value);
                          presenter.loadFipeInfoData();
                        }
                      },
                      items: snapshot.data ?? [],
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
