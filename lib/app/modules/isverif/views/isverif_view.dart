import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global/theme/my_color.dart';
import '../../../global/theme/my_component_style.dart';
import '../../../global/theme/my_text_style.dart';
import '../controllers/isverif_controller.dart';

class IsverifView extends GetView<IsverifController> {
  const IsverifView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Verified'),
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
                  "Daftar Alat yang telah di Verifikasi",
                  style: titleStyle.copyWith(color: primaryClr),
                ),
              ),
              SizedBox(
                height: (120 * (state?.length ?? 1)) +
                    10, //9 is n item + 120 is height of
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(22),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state![index].alat?.namaWeselOrSinyal ??
                                            "",
                                        style: titleStyle,
                                      ),
                                      Text(
                                        state[index].hasilPenilaian ?? "",
                                        style: subTitleStyle,
                                      ),
                                      Text(
                                        "Pemeriksaan minggu ke-${state[index].mingguke}",
                                        style: subTitleStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
              verticalSpace(24),
            ],
          ),
        );
      },
          onEmpty: const Center(
            child: Text("Data verified is empty"),
          )),
    );
  }
}
