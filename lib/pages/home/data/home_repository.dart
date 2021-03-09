import 'package:flutter_my_base_getx/pages/home/domain/adapters/repository_adapter.dart';
import 'package:flutter_my_base_getx/pages/home/domain/entity/cases_model.dart';
import 'package:flutter_my_base_getx/shared/logger/logger_utils.dart';

import 'home_api_provider.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({this.provider});
  final IHomeProvider provider;

  @override
  Future<CasesModel> getCases() async {
    final cases = await provider.getCases("/summary");
    print(cases.body.date);
    if (cases.status.hasError) {
      return Future.error(cases.statusText);
    } else {
      return cases.body;
    }
  }

  @override
  Future<String> getString() async{
    print("heklloo");
    final string = await provider.getString("");
    // print("hihi");
    // print(string.body);
    // if(string.status.hasError){
    //   print("loi$string");
    //   return Future.error(string.statusText);
    // }else{
    //   print(string.body);
    //   return string.body;
    // }
    return string.bodyString;

  }


}