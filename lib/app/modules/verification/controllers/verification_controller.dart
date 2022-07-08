import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController
    with StateMixin<List<bool>> {
  final isChecking = true.obs;
  List<bool> listSelect = [];

  @override
  void onInit() {
    super.onInit();
    listSelect = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    change(listSelect, status: RxStatus.success());
  }

  void updateSelectList(int index, bool value) {
    listSelect[index] = value;
    change(listSelect, status: RxStatus.success());
  }
}
