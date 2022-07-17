import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maintenance_app/app/global/constants/images.dart';
import 'package:maintenance_app/app/global/theme/my_color.dart';
import 'package:maintenance_app/app/global/theme/my_component_style.dart';
import 'package:maintenance_app/app/global/theme/my_text_style.dart';

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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
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
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              onChanged: (value) =>
                                  controller.nipp.value = value,
                              decoration:
                                  const InputDecoration(hintText: 'NIPP'),
                            ),
                            verticalSpace(16),
                            TextFormField(
                                onChanged: (value) =>
                                    controller.password.value = value,
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: const InputDecoration(
                                    hintText: 'Password')),
                            verticalSpace(20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.login();
                                  },
                                  child: const Text('LOGIN')),
                            ),
                            verticalSpace(24),
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
                ? const CircularProgressIndicator()
                : Container(),
          );
        })
      ],
    ));
  }
}
