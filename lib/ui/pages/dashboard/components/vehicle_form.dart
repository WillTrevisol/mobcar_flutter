import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobcar/ui/components/components.dart';

class VehicleForm extends StatelessWidget {
  const VehicleForm({Key? key}) : super(key: key);

  InputDecoration _inputDecoration({String? text}) {
    return InputDecoration(
      hintText: text ?? '',
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 12),
            const SizedBox(height: 12),
            const SizedBox(height: 12),
            TextFormField(
              readOnly: true,
              decoration: _inputDecoration(),
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
  }
}
