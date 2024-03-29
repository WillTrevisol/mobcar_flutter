import 'package:flutter/material.dart';

class PriceField extends StatelessWidget {
  const PriceField({Key? key, required this.price}) : super(key: key);

  final String? price;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: price ?? 'R\$',
        hintStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
