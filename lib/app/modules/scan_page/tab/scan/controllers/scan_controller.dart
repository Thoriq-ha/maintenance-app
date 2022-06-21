import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/local/data.dart';
import '../../../../../data/model/alat.dart';
import '../../../../../global/constants/appconfig.dart';
import '../../../../../routes/app_pages.dart';

class ScanController extends GetxController {
  final SharedPreferences _data = SharedData.pref;
  final _dio = Dio();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Rx<Barcode> result = Barcode("", BarcodeFormat.codabar, []).obs;
  QRViewController? qrController;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";
  }

  @override
  void onClose() {
    qrController?.dispose();
    result = Barcode("", BarcodeFormat.codabar, []).obs;
    super.onClose();
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData;
      if (result.value.code != null) {
        scan();
        Get.offNamed(Routes.FORM);
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  scan() async {
    try {
      final res = await _dio
          .post('$baseUrl/find-alat', data: {"alat": "${result.value.code}"});
      if (res.statusCode == 200) {
        Alat alat = Alat.fromJson(res.data['data']);
        Get.snackbar(
            'Succes', 'Mendapatkan data alat ${alat.namaWeselOrSinyal}');
        print(alat.namaWeselOrSinyal);
      } else {
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
