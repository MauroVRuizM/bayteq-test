import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bayteq_test/app/modules/home/home_binding.dart';
import 'package:bayteq_test/app/modules/home/home_page.dart';
import 'package:bayteq_test/app/routes/app_pages.dart';
import 'package:bayteq_test/app/core/utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      title: 'Bayteq Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: HomeBinding(),
      home: const HomePage(),
      getPages: AppPages.pages,
    );
  }
}
