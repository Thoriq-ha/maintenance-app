import 'package:flutter/material.dart';

import '../../../global/constants/images.dart';
import '../../../global/theme/my_color.dart';
import '../../../global/theme/my_component_style.dart';
import '../controllers/home_controller.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: primaryClr,
            ),
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: CircleAvatar(
                      minRadius: 30,
                      backgroundColor: Colors.white,
                      child: Image(
                          image: AssetImage(Images.profile),
                          fit: BoxFit.cover,
                          height: 100),
                    ),
                  ),
                  verticalSpace(6),
                  Text(controller.name.value),
                  Text(controller.nip.value)
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Keluar'),
            onTap: () {
              controller.logOut();
            },
          ),
        ],
      ),
    );
  }
}
