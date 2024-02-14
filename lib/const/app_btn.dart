
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/const/app_text.dart';
import 'package:promilo/const/color_const.dart';

class AppBtn extends StatelessWidget {
  VoidCallback? onPress;
  String text;
  Color? textColor;
  Color? bgColor;
  Color? borderColor;
  FontWeight txtWeight;
  double fontSize;
  double width;
  double radius;

  AppBtn({
        this.onPress,
        this.text = 'Hi!',
        this.textColor,
        this.bgColor,
        this.borderColor,
        this.txtWeight=FontWeight.w500,
        this.fontSize=16,
        this.width=125,
        this.radius=12,
      });

  @override
  Widget build(BuildContext context) {
    textColor ??= ColorConst.primaryColor;
    bgColor ??= ColorConst.secondaryColor;
    if(borderColor==null){
      borderColor = bgColor;
    }else{
      borderColor = borderColor;
    }


    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.width * 0.0022;
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width * unitHeightValue,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: borderColor!,
            width: 2
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: AppText(
          text: text,
          textAlign: TextAlign.center,
          txtWeight: txtWeight,
          textColor: textColor,
          fontSize: fontSize,
        ).marginSymmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
