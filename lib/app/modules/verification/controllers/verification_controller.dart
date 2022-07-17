// ignore_for_file: avoid_print, prefer_is_empty

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/data/model/stasiun.dart' as sts;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local/data.dart';
import '../../../global/constants/appconfig.dart';
import '../../../data/model/verification.dart';

class VerificationController extends GetxController
    with StateMixin<List<Verification>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  final isChecking = true.obs;
  var stasiunData = Get.arguments[0] as sts.Stasiun;
  List<Verification>? _verification = [];
  final List<int> _idVerifWhenSelected = [];
  RxString nipp = ''.obs;
  RxString password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
    getVerification();
  }

  void updateSelectList(int index) {
    Verification temp = _verification![index];
    var newValue = !temp.isSelect;
    Verification newData = temp.copyWith(isSelect: newValue);

    _verification![index] = newData;
    change(_verification, status: RxStatus.success());
  }

  getVerification() async {
    dynamic res;
    try {
      change(_verification, status: RxStatus.loading());
      res = await _dio
          .get('$baseUrl/list-un-verified?stasiun_id=${stasiunData.id}');

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

  postVerification() async {
    try {
      getIdSelected();
      final res = await _dio.post(
          '$baseUrl/verifikasi?nipp=$nipp&password=$password',
          data: {"verifikasi_id": _idVerifWhenSelected});
      if (res.statusCode == 200) {
        print('Verification is Successfully');
        var jsonData = res.data['message'];
        Get.snackbar('Succes', '$jsonData');
      } else {
        Get.snackbar('Failed', '${res.data['error']}');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        Get.snackbar(
            '${e.response?.data['message']}', '${e.response?.data['error']}');
      } else {
        print(e.message);
      }
    }
  }

  getIdSelected() {
    _idVerifWhenSelected.clear();
    _verification?.forEach((element) {
      if (element.isSelect == true) {
        _idVerifWhenSelected.add(element.id);
      }
    });
  }
}
