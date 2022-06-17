import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  const CustomListTile({Key? key, this.iconData, this.onSelected, this.titleText, this.year, this.choices, this.choice, this.itemBuilder}) : super(key: key);

  final IconData? iconData;
  final Function(String choice)? onSelected;
  final List<PopupMenuEntry<String>>Function(BuildContext context)? itemBuilder;
  final String? titleText;
  final String? year;
  final List<String>? choices;
  final String? choice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.car_rental_outlined,
      ),
      title: const Text('Title'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Year'),
          TextButton(
            child: const Text('View More'),
            onPressed: () {},
          ),
        ],
      ),
      trailing: PopupMenuButton<String>(
        onSelected: onSelected,
        itemBuilder: itemBuilder!
      ),
    );
  }
}