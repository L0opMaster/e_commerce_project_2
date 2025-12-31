import 'package:flutter/material.dart';

class RoundTextfieldCopy extends StatelessWidget {
  final TextEditingController? controller;
  final double left;
  final double right;
  final double top;

  final String hintText;
  final String title;
  final TextInputType? keybordTyoe;
  final bool obscureText;
  final double? width;
  final BorderRadiusGeometry borderRadius;
  final double fontSize;
  final TextAlign alignment;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? lefticon;
  const RoundTextfieldCopy({
    super.key,
    this.padding,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.lefticon,
    this.controller,
    this.height,
    required this.hintText,
    this.keybordTyoe,
    required this.obscureText,
    this.width,
    this.title = '',
    this.fontSize = 14,
    this.alignment = TextAlign.start,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: TextField(
        textAlign: alignment,
        autocorrect: false,
        controller: controller,
        keyboardType: keybordTyoe,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: padding,
          //     enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.blue, width: 2.0),
          // ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          prefixIcon: lefticon,
          hintStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
