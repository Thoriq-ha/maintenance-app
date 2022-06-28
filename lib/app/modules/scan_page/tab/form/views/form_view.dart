import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_component_style.dart';
import 'package:maintenance_app/app/modules/scan_page/tab/form/views/my_form.dart';
import '../../../../../global/constants/svgs.dart';
import '../../../../../global/theme/my_text_style.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Text(controller.nameAlat.value);
          }),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => MyForm(state ?? []),
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
        ));
  }
}
