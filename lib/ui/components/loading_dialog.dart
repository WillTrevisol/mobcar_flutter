import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (context) {
      return const SimpleDialog(
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                'Aguarde...',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      );
    },
  );
}

void hideLoading(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}