import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/modules/scan_page/tab/form/controllers/form_controller.dart';
import 'package:maintenance_app/app/modules/scan_page/tab/history/controllers/history_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../global/constants/svgs.dart';
import '../tab/form/views/form_view.dart';
import '../tab/history/views/history_view.dart';
import '../tab/scan/views/scan_view.dart';

class HomeScanController extends GetxController {
  final currentIndex = 1.obs;
  final _formC = Get.put(FormController());
  final _historyC = Get.put(HistoryController());
  final SharedPreferences _data = SharedData.pref;
  String nameAlat = '';

  void changeIndex(int index) {
    nameAlat = _data.getString('namaAlat') ?? 'No Data';
    if (nameAlat == 'No Data') {
      Get.snackbar("Can't open Tab Menu", "Scan alat first");
      currentIndex.value = 1;
    } else {
      currentIndex.value = index;
    }
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
        _historyC.updateController();
        return const HistoryView();
      default:
        return const ScanView();
    }
  }
}
