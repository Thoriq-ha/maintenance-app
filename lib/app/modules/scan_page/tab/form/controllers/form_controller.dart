// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/local/data.dart';
import '../../../../../data/model/form.dart';
import '../../../../../global/constants/appconfig.dart';
import '../../../../../routes/app_pages.dart';

class FormController extends GetxController with StateMixin<List<Golongans>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  RxString name = ''.obs;
  RxBool isLoading = false.obs;
  List<Golongans>? listGolongan;
  late int id;

  @override
  void onInit() {
    super.onInit();

    print("set tokennnn");
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
  }

  @override
  void onReady() {
    super.onReady();
    getFormData();
  }

  //1 wesel mekanik
  //2 wesel listrik
  //3 sinyal mekanik
  //4 sinyal listrik

  getFormData() async {
    int _id = 0;
    String tipe = _data.getString('tipe') ?? '';
    switch (tipe) {
      case 'wesel_mekanik':
        _id = 1;
        break;
      case 'wesel _listrik':
        _id = 2;
        break;
      case 'sinyal_mekanik':
        _id = 3;
        break;
      case 'sinyal_listrik':
        _id = 4;
        break;
    }
    print(_id.toString());
    try {
      change(listGolongan, status: RxStatus.loading());
      final res = await _dio.get('$baseUrl/detail-item/2');
      if (res.statusCode == 200) {
        listGolongan = DataForm.fromJson(res.data['data']).golongans;
        change(listGolongan, status: RxStatus.success());
      } else {
        change(listGolongan, status: RxStatus.error());
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print(e);
      change(listGolongan, status: RxStatus.error());
    }
  }

  submitForm(String data, String hasilPenilaian) async {
    try {
      isLoading.value = true;
      id = _data.getInt('id') ?? -1;
      hasilPenilaian = "Baik Tidak ada catatan";
      final res = await _dio.post(
          '$baseUrl/checking-alat/$id?hasil_penilaian=$hasilPenilaian',
          data: data);
      print(res);
      if (res.statusCode == 200) {
        print('Data input success');
        Get.snackbar('Succes', 'Data input succes');
        isLoading.value = false;
        Get.offNamed(Routes.HOME);
      } else {
        Get.snackbar('Failed', 'Failed to login');
        print(res.statusCode);
        print(res.statusMessage);

        isLoading.value = false;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        Get.snackbar('Failed', 'Data has been entered this week');
      } else {
        print(e.message);
      }
      isLoading.value = false;
    }
  }
}
