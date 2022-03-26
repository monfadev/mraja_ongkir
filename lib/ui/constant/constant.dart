import 'package:flutter/material.dart';

const double defaultMargin = 20.0;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

Color primaryColor = Colors.black;
Color secondaryColor = const Color(0xffFFFFFF);

Color get shadowColor => Colors.black.withOpacity(.05);
BoxShadow get shadow => BoxShadow(color: shadowColor, blurRadius: 5, spreadRadius: 1);

const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

InputDecoration fieldDecoration(String? value) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade100),
      ),
      labelText: value,
    );

ButtonStyle get normalButton => TextButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      primary: Colors.white,
    );
ButtonStyle get borderButton => TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primaryColor),
      ),
    );
