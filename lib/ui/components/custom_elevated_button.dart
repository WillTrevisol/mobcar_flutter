import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  
  const CustomElevatedButton({
    super.key, 
    required this.onPressed,
    required this.widget, 
    required this.color,
    this.borderColor,
  });

  final VoidCallback onPressed;
  final Widget widget;
  final Color color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor ?? Colors.transparent)
          ),
        ),
      child: widget,
    );
  }
}
