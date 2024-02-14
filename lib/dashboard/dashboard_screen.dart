
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/ctr/get_controller.dart';
import 'package:promilo/dashboard/bottom_navigation_bar.dart';

class DashboardAppScreen extends StatefulWidget {
  static const routeName = '/Dashboard-screen';

  const DashboardAppScreen({super.key});

  @override
  _DashboardAppScreenState createState() => _DashboardAppScreenState();
}

class _DashboardAppScreenState extends State<DashboardAppScreen> with SingleTickerProviderStateMixin{
  DateTime? lastPressed;
  final RxBool _isLoading = false.obs;
  DateTime? currentBackPressTime;
  late GetController dashBoardController;

  @override
  void initState() {
    _isLoading.value = true;
    dashBoardController = Get.put<GetController>(GetController());
    dashBoardController.context = context;
    dashBoardController.controller = AnimationController(vsync: this, duration: dashBoardController.duration);
    dashBoardController.scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(dashBoardController.controller);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: !Get.isDarkMode ? Colors.white : Colors.black,
        body: Center(
          child: Obx(
                () => dashBoardController.getBodyWidgetPage(
              dashBoardController.currentIndex.value,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: DynamicBottomNavigationBar(
            currentIndex: dashBoardController.currentIndex,
            onSelectItem: _onSelectItem,
          ).marginSymmetric(horizontal: 0),
        ),
    );
  }

  _onSelectItem(int index) {
    dashBoardController.currentIndex.value = index;
  }
}
