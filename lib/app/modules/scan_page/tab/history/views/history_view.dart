import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';

import '../../../../../global/theme/my_component_style.dart';
import '../../../../../global/theme/my_text_style.dart';
import '../../../../station/views/custom_card.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
      ),
      body: controller.obx((state) {
        return SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(28),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Daftar Wesel",
                style: titleStyle.copyWith(color: primaryClr),
              ),
            ),
            SizedBox(
              height: (120 * (state?.length ?? 1)) +
                  40, //9 is n item + 120 is height of
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state?.length,
                  itemBuilder: (context, index) => CustomPaint(
                        painter: indikator(state?[index].mingguke),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(36.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state?[index].namaWeselAtauSinyal}",
                                  style: titleStyle,
                                ),
                                Text(
                                  "${state?[index].hasilPenilaian}",
                                  style: subTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          ],
        ));
      }),
    );
  }

  RPSCustomPainter indikator(String? mingguke) {
    int minggu = int.parse(mingguke ?? "0");
    switch (minggu) {
      case 1:
        return RPSCustomPainter(Colors.red);
      case 2:
        return RPSCustomPainter(Colors.yellow);
      case 3:
        return RPSCustomPainter(Colors.green);
      case 4:
        return RPSCustomPainter(Colors.green);
      default:
        return RPSCustomPainter(Colors.red);
    }
  }
}
