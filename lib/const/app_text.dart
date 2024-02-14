import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/const/color_const.dart';

class AppText extends StatelessWidget {
  String text;
  Color? textColor;
  FontWeight txtWeight;
  double fontSize;
  double txtSpace;
  TextAlign textAlign;
  TextOverflow textOverflow;
  TextDecoration decoration;

  AppText(
      {this.text = 'Hi!',
        this.textColor,
        this.txtWeight=FontWeight.w500,
        this.fontSize=15,
        this.txtSpace=0.0,
        this.textAlign=TextAlign.start,
        this.textOverflow=TextOverflow.visible,
        this.decoration=TextDecoration.none
      });

  @override
  Widget build(BuildContext context) {
    textColor ??= ColorConst.txtColor;
    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.width * 0.0022;
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: textColor,
          overflow: textOverflow,
          fontSize: fontSize * unitHeightValue,
          fontWeight: txtWeight,
          letterSpacing: txtSpace,
        decoration: decoration
      ),
    );
  }
}

