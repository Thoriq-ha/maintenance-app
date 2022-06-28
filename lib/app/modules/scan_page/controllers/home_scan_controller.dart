import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/modules/scan_page/tab/form/controllers/form_controller.dart';

import '../../../global/constants/svgs.dart';
import '../tab/form/views/form_view.dart';
import '../tab/history/views/history_view.dart';
import '../tab/scan/views/scan_view.dart';

class HomeScanController extends GetxController {
  final currentIndex = 1.obs;
  final _formC = Get.put(FormController());

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Widget scanSvg() => currentIndex.value == 1
      ? SvgPicture.asset(Svgs.icScan)
      : SvgPicture.asset(Svgs.icScanUnselected);

  Widget bodyView() {
    switch (currentIndex.value) {
      case 0:
        _formC.updateForm();
        return const FormView();
      case 1:
        return const ScanView();
      case 2:
        return const HistoryView();
      default:
        return const ScanView();
    }
  }
}
