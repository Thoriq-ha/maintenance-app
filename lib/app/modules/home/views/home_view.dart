import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/images.dart';
import 'package:maintenance_app/app/global/theme/my_component_style.dart';
import 'package:maintenance_app/app/global/theme/my_text_style.dart';
import 'package:maintenance_app/app/routes/app_pages.dart';

import '../../../global/constants/svgs.dart';
import '../../../global/theme/my_color.dart';
import '../controllers/home_controller.dart';
import 'drawer_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maintenance App',
          style: appBarTextStyle,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) => SizedBox(
                        width: 300,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1612527670286-1912f78763f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80",
                          fit: BoxFit.cover,
                        ),
                      )),
            ),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Daftar Stasiun",
                style: subTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.obx(
                (state) => SizedBox(
                  height: (100 * (state?.length ?? 1)) +
                      40, //9 is n item + 100 is height of
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state?.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.STATION),
                              child: SizedBox(
                                height: 100,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state?[index].namaStasiun}",
                                          style: titleStyle,
                                        ),
                                        Text(
                                          "Lorem Ipsum akjsn alsn aosjn lans asn asn ",
                                          style: subTitleStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerView(controller: controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.HOME_SCAN);
        },
        tooltip: "Scan",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Svgs.icScanWhite),
            Text(
              "SCAN",
              style: titleStyle.copyWith(color: Colors.white, fontSize: 9),
            )
          ],
        ),
      ),
    );
  }
}
