// ignore_for_file: prefer_is_empty

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../data/model/stasiun.dart' as sts;
import '../../../data/model/verification.dart';
import '../../../global/constants/appconfig.dart';

class IsverifController extends GetxController
    with StateMixin<List<Verification>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();
  List<Verification>? _verification = [];
  var stasiunData = Get.arguments[0] as sts.Stasiun;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
    getVerification();
  }

  getVerification() async {
    dynamic res;
    try {
      change(_verification, status: RxStatus.loading());
      res = await _dio
          .get('$baseUrl/list-is-verified?stasiun_id=${stasiunData.id}');

      if (res.statusCode == 200) {
        _verification = Data.fromJson(res.data).verification;
        if (_verification?.length == 0) {
          change(_verification, status: RxStatus.empty());
        } else {
          change(_verification, status: RxStatus.success());
        }
      } else {
        change(_verification, status: RxStatus.error());
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      change(_verification, status: RxStatus.error());
    }
  }
}
