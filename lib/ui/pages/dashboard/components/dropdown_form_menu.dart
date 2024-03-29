import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';

class DropdownFormMenu<T> extends StatelessWidget {
  const DropdownFormMenu({
    Key? key,
    required this.itemsLabel,
    required this.onChanged,
    required this.items,
    required this.hintText
  }) : super(key: key);

  final String Function(T) itemsLabel;
  final void Function(T?) onChanged;
  final List<T>? items;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      filterFn: (item, filter) {
        return item.toString().toLowerCase().contains(filter.toLowerCase());
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          label: Text(hintText),
          hintText: hintText
        ),
        baseStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      popupProps: const PopupProps.menu(
        fit: FlexFit.tight,
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Digite aqui para procurar...'
          ),
        ),
        searchDelay: Duration(seconds: 0),
      ),
      itemAsString: itemsLabel,
      onChanged: onChanged,
      items: items ?? [],
    );
  }
}