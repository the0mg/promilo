
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/const/color_const.dart';

class DynamicBottomNavigationBar extends StatelessWidget {
  final Function(int) onSelectItem;
  final RxInt currentIndex;

  const DynamicBottomNavigationBar({
    Key? key,
    required this.onSelectItem,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<IconData> bottomNavigationBarItem = <IconData>[
      CupertinoIcons.home,
      Icons.restaurant_menu_rounded,
      CupertinoIcons.hand_draw_fill,
      Icons.explore,
      Icons.person,
    ];

    final List<String> toolTip = <String>[
      'Home',
      'Project',
      'Meetup',
      'Explore',
      'Profile',
    ];


    return Obx(
      () => SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight:  Radius.circular(30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: onSelectItem,
            currentIndex: currentIndex.value,
            unselectedItemColor: ColorConst.txtColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.greenAccent.shade200,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorConst.secondaryColor,
            ),
            items: <BottomNavigationBarItem>[
              for (int i = 0; i < bottomNavigationBarItem.length; i++) ...{
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                        bottomNavigationBarItem[i],
                        color: ColorConst.txtColor,
                        size: currentIndex.value == i
                            ? 25
                            : 22
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Icon(
                        bottomNavigationBarItem[i],
                        color: Colors.greenAccent.shade200,
                        size: currentIndex.value == i
                            ? 25
                            : 22
                    ),
                  ),
                  label: toolTip[i].toString(),
                  tooltip: toolTip[i].toString(),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}