import 'package:flutter/material.dart';
import 'package:mobcar/main.dart';
import 'package:mobcar/theme.dart';

class CustomIconButton extends StatelessWidget {

  // ignore: use_key_in_widget_constructors
  const CustomIconButton({this.radius, this.icon, this.onTap});

  final double? radius;
  final Icon? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: icon,
        ),
      ),
    );
  }

}