import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';

void main() {

  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190)
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: PageRoutes.splashRoute,

      getPages: AppPages.pages,
    );
  }
}

