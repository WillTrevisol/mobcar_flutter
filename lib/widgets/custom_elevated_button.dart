import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  
  const CustomElevatedButton({Key? key, 
    required this.onPressed,
    required this.text, 
    required this.color, 
    required this.textColor, 
    this.borderColor}) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        elevation: MaterialStateProperty.all<double>(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor ?? Colors.transparent)
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}