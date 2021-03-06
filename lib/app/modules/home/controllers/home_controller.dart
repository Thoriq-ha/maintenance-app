// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../data/model/stasiun.dart';
import '../../../global/constants/appconfig.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<Stasiun>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  RxString name = ''.obs;
  RxString nipp = ''.obs;
  List<Stasiun>? stasiun;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    name.value = _data.getString('name') ?? "";
    nipp.value = _data.getString('nipp') ?? "";
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
    getStasiun();
  }

  logOut() async {
    try {
      isLoading.value = true;
      final res = await _dio.post('$baseUrl/logout');
      await _data.clear();

      if (res.statusCode == 200) {
        var jsonData = res.data['message'];
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar('Succes', '$jsonData');
      } else {}
    } catch (e) {
      isLoading.value = false;
    }
  }

  getStasiun() async {
    try {
      change(stasiun, status: RxStatus.loading());
      final res = await _dio.get('$baseUrl/stasiun');
      if (res.statusCode == 200) {
        List<Stasiun>? stasiun = Data.fromJson(res.data).stasiun;
        change(stasiun, status: RxStatus.success());
      } else {
        change(stasiun, status: RxStatus.error());
        Get.snackbar('Failed', 'Failed get data stasiun');
      }
    } catch (e) {
      print(e);
      change(stasiun, status: RxStatus.error());
    }
  }
}
