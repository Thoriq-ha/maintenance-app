import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/svgs.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../controllers/home_scan_controller.dart';

class HomeScanView extends GetView<HomeScanController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: controller.bodyView(),
        bottomNavigationBar: Container(
            color: Colors.white,
            child: SalomonBottomBar(
              currentIndex: controller.currentIndex.value,
              onTap: (i) {
                controller.changeIndex(i);
              },
              margin: EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              unselectedItemColor: Colors.grey,
              items: [
                SalomonBottomBarItem(
                  icon: FaIcon(FontAwesomeIcons.circlePlus),
                  title: Text("Form"),
                ),
                SalomonBottomBarItem(
                  icon: controller.scanSvg(),
                  title: Text("Scan"),
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.history),
                  title: Text("History"),
                ),
              ],
            ))));
  }
}
