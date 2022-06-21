import 'package:get/get.dart';

import '../controllers/station_controller.dart';

class StationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StationController>(
      () => StationController(),
    );
  }
}
