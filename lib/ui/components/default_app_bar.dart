import 'package:flutter/material.dart';

class DefaultAppBar {
  static appBar(BuildContext context) => AppBar(
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.blur_circular_outlined),
        Text(
          'MOBCAR',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ]
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.menu_open_outlined),
        onPressed: () {},
      ),
    ],
  );
}