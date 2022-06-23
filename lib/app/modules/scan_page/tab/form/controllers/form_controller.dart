import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/local/data.dart';
import '../../../../../data/model/form.dart';
import '../../../../../data/model/stasiun.dart';
import '../../../../../global/constants/appconfig.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/home_scan_controller.dart';

class FormController extends GetxController with StateMixin<List<Golongans>> {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();

  RxString name = ''.obs;
  List<Golongans>? listGolongan;

  @override
  void onInit() {
    super.onInit();

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
      // Todo
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
}
