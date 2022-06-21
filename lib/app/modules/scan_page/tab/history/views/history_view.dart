import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';

import '../../../../../global/constants/images.dart';
import '../../../../../global/theme/my_component_style.dart';
import '../../../../../global/theme/my_text_style.dart';
import '../../../../station/views/custom_card.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HistoryView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
            height: (120 * 9) + 40, //9 is n item + 120 is height of
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: (context, index) => CustomPaint(
                      painter: RPSCustomPainter(Colors.green),
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
                                "Wesel 11A",
                                style: titleStyle,
                              ),
                              Text(
                                "Baik tidak ada temuan",
                                style: subTitleStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      )),
    );
  }
}
