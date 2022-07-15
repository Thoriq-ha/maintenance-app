import 'package:get/get.dart';

import '../controllers/isverif_controller.dart';

class IsVerifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsverifController>(
      () => IsverifController(),
    );
  }
}
