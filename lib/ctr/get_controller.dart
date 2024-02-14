
// import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/screens/home_screen.dart';


class GetController extends GetxController{
  final Duration duration = const Duration(milliseconds: 500);
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  DateTime? currentBackPressTime;
  BuildContext? context;

  RxInt currentIndex = 2.obs;

  Widget getBodyWidgetPage(int value) {
    // print('val: $value');
    switch (value) {
      case 0: return WillPopScope(onWillPop: onWillPop, child:  Container());
      case 1: return WillPopScope(onWillPop: onWillPop, child: Container());
      case 2: return  WillPopScope(onWillPop: onWillPop, child: const HomeScreen());
      case 3: return WillPopScope(onWillPop: onWillPop, child:  Container());
      case 4: return WillPopScope(onWillPop: onWillPop, child:  Container());
      default:
        return const Center(
          child: Text("🙀"),
        );
    }
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      var snackBar = SnackBar(content: Text('Press back again to exit!!...'));
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
      return Future.value(false);
    }
    return Future.value(true);
  }

}