import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../global/constants/svgs.dart';
import '../tab/form/views/form_view.dart';
import '../tab/history/views/history_view.dart';
import '../tab/scan/views/scan_view.dart';

class HomeScanController extends GetxController {
  final currentIndex = 1.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Widget scanSvg() => currentIndex == 1
      ? SvgPicture.asset(Svgs.icScan)
      : SvgPicture.asset(Svgs.icScanUnselected);

  Widget bodyView() {
    switch (currentIndex.value) {
      case 0:
        return FormView();
      case 1:
        return ScanView();
      case 2:
        return HistoryView();
      default:
        return ScanView();
    }
  }
}
