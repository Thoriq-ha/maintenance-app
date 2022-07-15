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

  RxBool isLoading = false.obs;
  List<Golongans>? listGolongan;
  late int _id;
  RxString nameAlat = ''.obs;
  RxString hasilPenilaian = ''.obs;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
  }

  @override
  void onReady() {
    super.onReady();
    updateForm();
  }

  void updateForm() {
    getFormData();
    nameAlat.value = _data.getString('namaAlat') ?? 'No Data';
  }

  //1 wesel mekanik
  //2 wesel listrik
  //3 sinyal mekanik
  //4 sinyal listrik
  getFormData() async {
    String tipe = _data.getString('tipe') ?? '';

    switch (tipe) {
      case 'wesel_mekanik':
        _id = 1;
        break;
      case 'wesel_elektrik':
        _id = 2;
        break;
      case 'sinyal_mekanik':
        _id = 3;
        break;
      case 'sinyal_elektrik':
        _id = 4;
        break;
      default:
        _id = 0;
        break;
    }

    try {
      change(listGolongan, status: RxStatus.loading());
      final res = await _dio.get('$baseUrl/detail-item/$_id');
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

  submitForm(String data) async {
    print(hasilPenilaian);
    try {
      isLoading.value = true;
      _id = _data.getInt('id') ?? -1;
      final res = await _dio.post(
          '$baseUrl/checking-alat/$_id?hasil_penilaian=${hasilPenilaian.value}',
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
        Get.snackbar('Failed', 'Data has been entered on this week');
      } else {
        print(e.message);
      }
      isLoading.value = false;
    }
  }
}
