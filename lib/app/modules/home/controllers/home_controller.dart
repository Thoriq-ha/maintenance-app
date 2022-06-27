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
  List<Stasiun>? stasiun;

  @override
  void onInit() {
    super.onInit();

    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
    getStasiun();
  }

  Future<void> logOut() async {
    await _data.clear();
    Get.offAllNamed(Routes.LOGIN);
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
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print(e);
      change(stasiun, status: RxStatus.error());
    }
  }
}
