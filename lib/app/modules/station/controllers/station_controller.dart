// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/data/model/alat.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../data/model/stasiun.dart' as sts;
import '../../../global/constants/appconfig.dart';

class StationController extends GetxController with StateMixin<List<Alat>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  final isWesel = true.obs;
  RxString name = ''.obs;
  List<Alat>? alat;
  var stasiunData = Get.arguments[0] as sts.Stasiun;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";

    _dio.options.headers["authorization"] = "Bearer $token";
    getAlat();
  }

  void changeIsWesel(bool data) {
    isWesel.value = data;
    getAlat();
  }

  getAlat() async {
    dynamic res;
    try {
      change(alat, status: RxStatus.loading());
      if (isWesel.value) {
        res = await _dio
            .get('$baseUrl/list-alat?alat=wesel&stasiun_id=${stasiunData.id}');
      } else {
        res = await _dio
            .get('$baseUrl/list-alat?alat=sinyal&stasiun_id=${stasiunData.id}');
      }
      print(res.data);

      if (res.statusCode == 200) {
        alat = Data.fromJson(res.data).alat;
        change(alat, status: RxStatus.success());
      } else {
        change(alat, status: RxStatus.error());
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print(e);
      change(alat, status: RxStatus.error());
    }
  }
}
