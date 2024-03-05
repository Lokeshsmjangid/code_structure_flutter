
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  double ? height;
  double ? width;
  final String text;
  final VoidCallback onPressed;
  double ? radius;
  double ? elevation;
  Color ? btnColor;
  Color ? btnTxtColor;
  Color ? btnShadow;
  final Widget iconButton;

  CustomIconButton({super.key,
    this.height,
    this.width,
    this.radius,
    this.btnColor,
    this.btnTxtColor,
    this.btnShadow,
    required this.text,
    required this.onPressed, required this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation??2),
          shadowColor: MaterialStateProperty.all(btnShadow),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??50),
          )),
          backgroundColor: MaterialStateProperty.all(btnColor??Colors.black),
        ),
        icon: iconButton,
        label: Text(
          text,
          style: TextStyle(
            color: btnTxtColor ?? Colors.yellow,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}