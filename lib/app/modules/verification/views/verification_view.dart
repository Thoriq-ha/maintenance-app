import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/images.dart';

import '../../../global/theme/my_color.dart';
import '../../../global/theme/my_component_style.dart';
import '../../../global/theme/my_text_style.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi PPKA'),
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
                  "Daftar Alat Verifikasi",
                  style: titleStyle.copyWith(color: primaryClr),
                ),
              ),
              SizedBox(
                height: (100 * ((9))), //9 is n item + 120 is height of
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: InkWell(
                            onTap: () {
                              bool value = !state![index];
                              controller.updateSelectList(index, value);
                            },
                            child: Card(
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
                                          "nama alat",
                                          style: titleStyle,
                                        ),
                                        Text(
                                          "hasil",
                                          style: subTitleStyle,
                                        ),
                                      ],
                                    ),
                                    (state![index]
                                        ? SvgPicture.asset(Images.onCheck)
                                        : SvgPicture.asset(Images.onCheckFalse))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        // controller.login();
                      },
                      child: const Text('Verification')),
                ),
              ),
              verticalSpace(24)
            ],
          ),
        );
      }),
    );
  }
}
