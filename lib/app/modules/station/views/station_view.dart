import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/images.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';

import '../../../global/theme/my_component_style.dart';
import '../../../global/theme/my_text_style.dart';
import '../controllers/station_controller.dart';
import 'custom_card.dart';

class StationView extends GetView<StationController> {
  const StationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StationView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Obx((() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      Images.dummyWesel,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                          height: 48,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeIsWesel(true);
                                    controller.getAlat();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (controller.isWesel.value)
                                            ? primaryClr
                                            : Colors.white,
                                        border: Border.all(color: primaryClr)),
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                        child: Text(
                                      "Wesel",
                                      style: titleStyle.copyWith(
                                          color: (controller.isWesel.value)
                                              ? Colors.white
                                              : primaryClr),
                                    )),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeIsWesel(false);
                                    controller.getAlat();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (controller.isWesel.value)
                                            ? Colors.white
                                            : primaryClr,
                                        border: Border.all(color: primaryClr)),
                                    child: Center(
                                      child: Text("Sinyal",
                                          style: titleStyle.copyWith(
                                              color: (controller.isWesel.value)
                                                  ? primaryClr
                                                  : Colors.white)),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ],
                          ))),
                  verticalSpace(28),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      (controller.isWesel.value)
                          ? "Daftar Wesel"
                          : "Daftar Sinyal",
                      style: subTitleStyle,
                    ),
                  ),
                  controller.obx((state) => SizedBox(
                      height: (120 * 9) + 40, //9 is n item + 100 is height of
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state?.length,
                          itemBuilder: (context, index) => CustomPaint(
                                painter: RPSCustomPainter(Colors.green),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(36.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state?[index].namaWeselOrSinyal}",
                                          style: titleStyle,
                                        ),
                                        Text(
                                          "Baik tidak ada temuan ${state?[index].namaWeselOrSinyal}",
                                          style: subTitleStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )))),
                ],
              ))),
        ));
  }
}
