import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/local/data.dart';
import '../../../../../data/model/riwayat.dart';
import '../../../../../global/constants/appconfig.dart';

class HistoryController extends GetxController with StateMixin<List<Riwayat>> {
  List<Riwayat>? riwayat;
  final _dio = Dio();
  final SharedPreferences _data = SharedData.pref;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
    getRiwayat();
  }

  getRiwayat() async {
    try {
      change(riwayat, status: RxStatus.loading());
      final res = await _dio.get('$baseUrl/riwayat');
      if (res.statusCode == 200) {
        riwayat = Data.fromJson(res.data).stasiun;
        change(riwayat, status: RxStatus.success());
      } else {
        change(riwayat, status: RxStatus.error());
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print(e);
      change(riwayat, status: RxStatus.error());
    }
  }
}
