// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../data/model/rekap.dart';
import '../../../global/constants/appconfig.dart';

class StationController extends GetxController with StateMixin<List<Rekap>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  final isWesel = true.obs;
  RxString name = ''.obs;
  List<Rekap>? rekap;
  var stasiun = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";

    _dio.options.headers["authorization"] = "Bearer $token";
    getRekap();
  }

  void changeIsWesel(bool data) {
    isWesel.value = data;
  }

  getRekap() async {
    dynamic res;
    try {
      change(rekap, status: RxStatus.loading());
      if (isWesel.value) {
        res = await _dio.get('$baseUrl/rekap?tipe=wesel');
      } else {
        res = await _dio.get('$baseUrl/rekap?tipe=sinyal');
      }

      if (res.statusCode == 200) {
        List<Rekap>? rekap = Data.fromJson(res.data, stasiun[0]).rekap;
        change(rekap, status: RxStatus.success());
      } else {
        change(rekap, status: RxStatus.error());
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print(e);
      change(rekap, status: RxStatus.error());
    }
  }
}
