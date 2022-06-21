import 'package:get/get.dart';

class FormController extends GetxController {
  // RxString singleValue = "Text alignment right".obs;
  // final verticalGroupValue = "Pending".obs;
  // final _status = ["Tidak diisi", "Belum Diisi", "Kosong"];
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
