import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mobcar/ui/components/components.dart';
import 'package:mobcar/ui/pages/pages.dart';


class VehicleDetailsDialog extends StatelessWidget {
  const VehicleDetailsDialog({super.key, required this.fipeInfo});

  final FipeInfoViewEntity fipeInfo;  

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [
      Icon(Icons.star, color: AppTheme.yellowMob),
      Icon(Icons.star, color: AppTheme.yellowMob),
      Icon(Icons.star, color: AppTheme.yellowMob),
      Icon(Icons.star, color: AppTheme.yellowMob),
      Icon(Icons.star, color: AppTheme.yellowMob),
    ];
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const FaIcon(FontAwesomeIcons.car),
                Text(
                  fipeInfo.brand,
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
            Stack(
              children: [
                Image.asset(
                  'assets/images/${fipeInfo.brand}.png',
                  errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/VW - VolksWagen.png'),
                ),
                Row(
                  children: stars,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text('Marca', style: Theme.of(context).textTheme.titleSmall),
                    Text(fipeInfo.brand, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 20),
                    Text('Modelo', style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        fipeInfo.model,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text('Ano', style: Theme.of(context).textTheme.titleSmall),
                    Text(fipeInfo.modelYear.toString(), style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 20),
                    Text('Valor', style: Theme.of(context).textTheme.titleSmall),
                    Text(fipeInfo.price, style: Theme.of(context).textTheme.bodySmall),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomElevatedButton(
                onPressed: () => Navigator.pop(context),
                widget: const Text(
                  'Reservar'
                ), 
                color: Colors.black, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
