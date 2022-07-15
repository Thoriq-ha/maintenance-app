// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maintenance_app/app/modules/scan_page/controllers/home_scan_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/local/data.dart';
import '../../../../../data/model/alat.dart';
import '../../../../../global/constants/appconfig.dart';

class ScanController extends GetxController {
  final SharedPreferences _data = SharedData.pref;
  final _homeScanC = Get.put(HomeScanController());
  final _dio = Dio();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isPersmitted = false;
  Rx<Barcode> result = Barcode("", BarcodeFormat.codabar, []).obs;
  QRViewController? qrController;

  @override
  void onInit() {
    super.onInit();
    String token = _data.getString('token') ?? "";
    _dio.options.headers["authorization"] = "Bearer $token";

    _data.remove('id');
    _data.remove('tipe');
    _data.remove('namaAlat');
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    qrController?.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData;
      if (result.value.code != null) {
        scan();
        qrController?.pauseCamera();
        //move to from checking
      }
    });
    qrController?.resumeCamera();
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    isPersmitted = p;
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  scan() async {
    try {
      _data.remove('id');
      _data.remove('tipe');
      _data.remove('namaAlat');
      final res = await _dio
          .post('$baseUrl/find-alat', data: {"alat": "${result.value.code}"});
      if (res.statusCode == 200) {
        Alat alat = Alat.fromJson(res.data['data']);
        _data.setInt('id', alat.id);
        _data.setString('tipe', alat.tipe);
        _data.setString('namaAlat', alat.namaWeselOrSinyal);

        print('${_data.getString('tipe')} in scann view');

        Get.snackbar(
            'Succes', 'Mendapatkan data alat ${alat.namaWeselOrSinyal}');
        _homeScanC.currentIndex.value = 0;
      } else {
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      print('error message $e');
      print(e.toString());
    }
  }
}
