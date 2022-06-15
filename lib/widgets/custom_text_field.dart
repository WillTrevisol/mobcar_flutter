import 'package:flutter/material.dart';
import 'package:mobcar/theme.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({this.controller, this.onChanged, this.onSubmitted, this.textInputType, this.hintText, this.prefix, this.suffix});

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType? textInputType;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey[300],
      ),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        showCursor: true,
        keyboardType: textInputType,
        decoration: InputDecoration(
          enabled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: MobCarColors.greyMob),
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}