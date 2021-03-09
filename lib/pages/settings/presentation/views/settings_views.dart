import 'package:flutter/material.dart';
import 'package:flutter_my_base_getx/pages/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class SettingsView extends GetView {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
            child: InkWell(
                onTap: () {
                  homeController.changeTest();
                },
                child: Text("Setting right here${homeController.isVJP}")),
          )),
    );
  }
}
