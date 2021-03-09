import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_my_base_getx/pages/home/domain/adapters/repository_adapter.dart';
import 'package:flutter_my_base_getx/pages/home/domain/entity/cases_model.dart';
import 'package:flutter_my_base_getx/routes/app_pages.dart';
import 'package:flutter_my_base_getx/shared/logger/logger_utils.dart';
import 'package:get/get.dart';

class HomeController extends SuperController<CasesModel> {
  var isVJP;

  HomeController({this.homeRepository});

  /// inject repo abstraction dependency
  final IHomeRepository homeRepository;

  /// When the controller is initialized, make the http request
  @override
  void onInit() {
    super.onInit();
    // show loading on start, data on success
    // and error message on error with 0 boilerplate
    homeRepository.getCases().then((data) {
      printInfo(info: data.toString());
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
    isVJP = 0.obs;
  }

  void changeTest() {
    Logger.write(
      isVJP.toString(),
    );
    isVJP++;
    Get.defaultDialog(
      onCancel: () {
        Logger.write("adu cancel");
      },
      onConfirm: () {
        print("confirm");
        print(Get.deviceLocale.languageCode);
        Get.updateLocale(Locale("vi_VN"));
        // Get.back();
        homeRepository.getString().then((value) {
          // printInfo(info: value.substring(0,20));
          // Get.back();
          Get.snackbar(jsonDecode(value)["countriesRoute"]["Name"],
              jsonDecode(value)["countriesRoute"]["Description"],snackPosition: SnackPosition.BOTTOM);
          Get.toNamed(Routes.SETTINGS);
        }, onError: (e) {
          printError(info: "loi o day");
          printError(info: e.toString());
        });
      },
    );
  }

  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
