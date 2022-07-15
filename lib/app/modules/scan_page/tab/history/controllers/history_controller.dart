// ignore_for_file: avoid_print

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

  RxString namaAlat = ''.obs;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
  }

  @override
  onReady() {
    updateController();
  }

  updateController() {
    namaAlat.value =
        "${_data.getString('tipe')} ${_data.getString('namaAlat')}";
    getRiwayat();
  }

  getRiwayat() async {
    String name = _data.getString('namaAlat') ?? "";
    try {
      change(riwayat, status: RxStatus.loading());
      final res = await _dio.get('$baseUrl/riwayat?nama_alat=$name');
      if (res.statusCode == 200) {
        print(namaAlat.value);
        riwayat = Data.fromJson(res.data).riwayat;
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
