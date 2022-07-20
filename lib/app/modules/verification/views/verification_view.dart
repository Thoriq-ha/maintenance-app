import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/images.dart';

import '../../../global/theme/my_color.dart';
import '../../../global/theme/my_component_style.dart';
import '../../../global/theme/my_text_style.dart';
import '../../../routes/app_pages.dart';
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
                  "Daftar Alat yang belum di Verifikasi",
                  style: titleStyle.copyWith(color: primaryClr),
                ),
              ),
              SizedBox(
                height: (100 * (state?.length ?? 1)) +
                    10, //9 is n item + 120 is height of
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: InkWell(
                            onTap: () {
                              controller.updateSelectList(index);
                            },
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
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
                                          state![index].namaAlat,
                                          style: titleStyle,
                                        ),
                                        Text(
                                          state[index].hasilPenilaian,
                                          style: subTitleStyle,
                                        ),
                                      ],
                                    ),
                                    (state[index].isSelect
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
                child: Column(
                  children: [
                    if (state!.isNotEmpty)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: Card(
                                          elevation: 0,
                                          child: Column(
                                            children: [
                                              verticalSpace(20),
                                              Text(
                                                'Verifikasi PPKA',
                                                style: headingStyle.copyWith(
                                                    color: primaryClr),
                                              ),
                                              Text(
                                                'Masukkan nip dan password anda untuk verifikasi',
                                                style: subHeadingStyle,
                                              ),
                                              verticalSpace(32),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onChanged: (value) =>
                                                          controller.nipp
                                                              .value = value,
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText: 'NIPP'),
                                                    ),
                                                    verticalSpace(16),
                                                    TextFormField(
                                                        onChanged: (value) =>
                                                            controller.password
                                                                .value = value,
                                                        obscuringCharacter: "*",
                                                        obscureText: true,
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    'Password')),
                                                    verticalSpace(20),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            controller
                                                                .postVerification();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'VERIFIKASI')),
                                                    ),
                                                    verticalSpace(24),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              );
                            },
                            child: const Text('Verification')),
                      )
                    else
                      verticalSpace(132),
                    verticalSpace(12),
                  ],
                ),
              ),
              verticalSpace(24),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.ISVERIF,
                          arguments: [controller.stasiunData]);
                    },
                    child: const Text("Lihat alat yang sudah diverifikasi"),
                  ),
                ),
              )
            ],
          ),
        );
      },
          onEmpty: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                  child:
                      Text("Lakukan pengisian form sebelum verifikasi PPKA")),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.ISVERIF,
                          arguments: [controller.stasiunData]);
                    },
                    child: const Text("Lihat alat yang sudah diverifikasi"),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
