import 'package:flutter/material.dart';

import 'dart:ui';

import 'app_colors.dart';

TextStyle titleTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
    color: blackColor,
    letterSpacing: 0.5);
TextStyle heading1 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
    color: blackColor,
    letterSpacing: 1);
TextStyle heading2 =  TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
    color: blackColor.withOpacity(0.4),
    letterSpacing: 0.5);
TextStyle editingTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
    color: blackColor,
    letterSpacing: 0.1);
TextStyle subtitleTextStyle =
    const TextStyle(fontSize: 16, color: grayColor, letterSpacing: 0.5);

TextFormField editTextfield = TextFormField(
  decoration: const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2))),
);



