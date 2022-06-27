import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/home_scan_controller.dart';

class HomeScanView extends GetView<HomeScanController> {
  const HomeScanView({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              unselectedItemColor: Colors.grey,
              items: [
                SalomonBottomBarItem(
                  icon: const FaIcon(FontAwesomeIcons.circlePlus),
                  title: const Text("Form"),
                ),
                SalomonBottomBarItem(
                  icon: controller.scanSvg(),
                  title: const Text("Scan"),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.history),
                  title: const Text("History"),
                ),
              ],
            ))));
  }
}
