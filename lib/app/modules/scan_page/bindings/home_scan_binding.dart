import 'package:get/get.dart';

import '../controllers/home_scan_controller.dart';
import '../tab/form/controllers/form_controller.dart';
import '../tab/history/controllers/history_controller.dart';
import '../tab/scan/controllers/scan_controller.dart';

class HomeScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScanController>(
      () => HomeScanController(),
    );
    Get.lazyPut<FormController>(
      () => FormController(),
    );
    Get.lazyPut<ScanController>(
      () => ScanController(),
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
  }
}
