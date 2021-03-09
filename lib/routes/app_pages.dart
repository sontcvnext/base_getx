import 'package:flutter_my_base_getx/pages/home/bindings/home_binding.dart';
import 'package:flutter_my_base_getx/pages/home/presentation/views/country_view.dart';
import 'package:flutter_my_base_getx/pages/home/presentation/views/details_view.dart';
import 'package:flutter_my_base_getx/pages/home/presentation/views/home_view.dart';
import 'package:flutter_my_base_getx/pages/settings/presentation/views/settings_views.dart';
import 'package:get/get.dart';
part 'app_routes.dart';
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: Routes.COUNTRY,
            page: () => CountryView(),
            children: [
              GetPage(
                name: Routes.DETAILS,
                page: () => DetailsView(),
              ),
            ],
          ),
        ]),
    GetPage(name: Routes.SETTINGS, page: ()=>SettingsView())
  ];
}