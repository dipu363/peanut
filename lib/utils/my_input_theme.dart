
import 'package:flutter/material.dart';
import 'app_colors.dart';



class MyInputTheme{
  TextStyle _buildTextStyle(Color color){
    return TextStyle(
      fontSize: 12,
      fontFamily: 'SFProDisplay',
      color: color,

    );

  }
  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: color, width: 1));
  }
  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16), // if use content padding then ignore isDense
     //isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelAlignment: FloatingLabelAlignment.start,



    //border
    enabledBorder: _buildBorder(blackColor.withOpacity(.3)),
    errorBorder: _buildBorder(red),
    focusedBorder: _buildBorder(primaryColor),
    focusedErrorBorder: _buildBorder(red),
    disabledBorder: _buildBorder(blackColor.withOpacity(.3)),
    // text style
    suffixStyle:_buildTextStyle(blackColor),
    counterStyle:_buildTextStyle(blackColor.withOpacity(.5)),
    floatingLabelStyle:_buildTextStyle(blackColor),
    errorStyle:_buildTextStyle(red.withOpacity(.7)),
    helperStyle:_buildTextStyle(blackColor.withOpacity(.5)),
    hintStyle:_buildTextStyle(blackColor.withOpacity(.4)),
    labelStyle:_buildTextStyle(blackColor.withOpacity(.5)),
    prefixStyle:_buildTextStyle(blackColor),
  );
}