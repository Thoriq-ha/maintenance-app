import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';

import '../../../../../global/constants/svgs.dart';
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
        title: Obx(() {
          return Text(controller.namaAlat.value);
        }),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(28),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "Daftar History",
                  style: titleStyle.copyWith(color: primaryClr),
                ),
              ),
              SizedBox(
                height: (120 *
                    ((state?.length ?? 1) +
                        1)), //9 is n item + 120 is height of
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(22),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state?[index].tipe} ${state?[index].namaWeselOrSinyal}",
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
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (e) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 280, child: SvgPicture.asset(Svgs.icDataNotFound)),
              verticalSpace(20),
              Text(
                "Data Not Found",
                style: titleStyle,
              )
            ],
          ),
        ),
      ),
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
