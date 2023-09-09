import 'package:flutter/material.dart';

class DefaultBottomBar extends StatelessWidget {
  const DefaultBottomBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            '© 2020. All rights reserved to Mobcar.',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
