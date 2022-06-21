import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../data/model/alat.dart';
import '../../../global/constants/appconfig.dart';

class StationController extends GetxController with StateMixin<List<Alat>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  final isWesel = true.obs;
  RxString name = ''.obs;
  List<Alat>? stasiun;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";

    if (token != null) {
      _dio.options.headers["authorization"] = "Bearer $token";
      getAlat();
    }
  }

  void changeIsWesel(bool data) {
    isWesel.value = data;
  }

  getAlat() async {
    dynamic res;
    try {
      change(stasiun, status: RxStatus.loading());
      if (isWesel.value) {
        res = await _dio.get('$baseUrl/list-alat?alat=wesel');
      } else {
        res = await _dio.get('$baseUrl/list-alat?alat=sinyal');
      }

      if (res.statusCode == 200) {
        List<Alat>? stasiun = Data.fromJson(res.data).alat;
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
