// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/local/data.dart';
import '../../../../data/model/user.dart';
import '../../../../global/constants/appconfig.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final _dio = Dio();
  final SharedPreferences _data = SharedData.pref;

  RxString nipp = ''.obs;
  RxString password = ''.obs;
  RxBool isLoading = false.obs;

  login() async {
    try {
      isLoading.value = true;
      final res = await _dio.post('$baseUrl/login', data: {
        'nipp': nipp.value,
        'password': password.value,
      });
      if (res.statusCode == 200) {
        print('User login success');
        var jsonData = res.data['data'];
        User user = User.fromJson(jsonData['user']);

        print(user);
        _data.setString('name', user.name);
        _data.setString('nipp', user.nipp);
        _data.setString('token', jsonData['token'].toString());

        isLoading.value = false;
        Get.offNamed(Routes.HOME);
        Get.snackbar(
          'Login Success',
          'Selamat datang ${user.name}',
        );
        return user;
      } else {
        Get.snackbar('Failed', 'Failed to login');
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
      return Get.snackbar(
        'Failed',
        'Login Failed',
        backgroundColor: orangeClr,
        colorText: white,
      );
    }
  }
}
