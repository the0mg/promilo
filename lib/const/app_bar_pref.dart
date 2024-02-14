
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_const.dart';

class PrefAppBar extends StatelessWidget {
  String text;
  Color? textColor;
  FontWeight txtWeight;
  double fontSize;
  double radius;
  VoidCallback? onPress;
  bool centerTitle;


  PrefAppBar(
      {this.onPress,
        this.text = '',
        this.textColor = ColorConst.txtColor,
        this.txtWeight=FontWeight.w600,
        this.fontSize=19,
        this.radius=0.0,
        this.centerTitle=false,
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.width * 0.0022;
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorConst.primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.00001),
                blurRadius: 0.5,
              )
            ]
        ),
        child: SafeArea(
             child: Column(
               children: [
                 Stack(
                  alignment: centerTitle ? Alignment.center : Alignment.centerLeft ,
                   children: [
                     Row(
                       children: [
                         InkWell(onTap: onPress,child: Icon(Icons.arrow_back_ios, color: textColor,),),
                       ],
                     ),
                      Text(
                        text,
                       style: TextStyle(
                         color:  textColor,
                         fontWeight: txtWeight,
                         fontSize: fontSize,
                       ),).marginOnly(left: !centerTitle ? 30 : 0),
                   ],
                 ).marginSymmetric(vertical: 15, horizontal: 15),

               ],
             )
         ),
      );
  }
}
