import 'package:bayteq_test/app/modules/home/home_binding.dart';
import 'package:get/get.dart';
import 'package:bayteq_test/app/routes/app_routes.dart';
import 'package:bayteq_test/app/modules/home/home_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.homePage,
        page: () => const HomePage(),
        binding: HomeBinding(),
        transition: Transition.leftToRightWithFade),
  ];
}