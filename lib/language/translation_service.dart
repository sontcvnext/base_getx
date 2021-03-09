
import 'package:flutter/material.dart';
import 'package:flutter_my_base_getx/language/vi_VN.dart';
import 'package:get/get.dart';

import 'en_US.dart';


class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en_US,
    'vi_VN': vi_VN,
  };
}