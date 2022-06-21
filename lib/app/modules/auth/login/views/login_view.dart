import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/images.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';
import 'package:maintenance_app/app/global/theme/my_component_style.dart';
import 'package:maintenance_app/app/global/theme/my_text_style.dart';

import '../../../../data/model/user.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.backgroundAuth), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    children: [
                      verticalSpace(20),
                      Text(
                        'Welcome !',
                        style: headingStyle.copyWith(color: primaryClr),
                      ),
                      Text(
                        'Login to Maintenance App',
                        style: subHeadingStyle,
                      ),
                      verticalSpace(32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (value) =>
                                  controller.nip.value = value,
                              decoration:
                                  const InputDecoration(hintText: 'NIP'),
                            ),
                            verticalSpace(16),
                            TextFormField(
                                onChanged: (value) =>
                                    controller.password.value = value,
                                decoration: const InputDecoration(
                                    hintText: 'Password')),
                            verticalSpace(20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    User user = controller.login(context);
                                  },
                                  child: const Text('LOGIN')),
                            ),
                            verticalSpace(24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Lupa password ?"),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("Klik Disini"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(() {
          return Center(
            child: (controller.isLoading.value)
                ? CircularProgressIndicator()
                : Container(),
          );
        })
      ],
    ));
  }
}
