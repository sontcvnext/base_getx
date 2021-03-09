import 'dart:convert';

import 'package:flutter_my_base_getx/pages/home/domain/entity/cases_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class IHomeProvider {
  Future<Response<CasesModel>> getCases(String path);
  Future<Response> getString(String path);
}

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    // httpClient.defaultDecoder = CasesModel.fromJson;
    httpClient.baseUrl = 'https://api.covid19api.com';
  }

  @override
  Future<Response<CasesModel>> getCases(String path) => get(path,decoder: CasesModel.fromJson);

  @override
  Future<Response> getString(String path) {
    return get(path);
  }
}