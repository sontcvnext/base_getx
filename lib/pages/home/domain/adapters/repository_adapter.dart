import 'package:flutter_my_base_getx/pages/home/domain/entity/cases_model.dart';

abstract class IHomeRepository {
  Future<CasesModel> getCases();
  Future<String> getString();
}