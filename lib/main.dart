
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:peanut/routes/app_pages.dart';

import 'module/auth/auth_binding.dart';
import 'module/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Peanut',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        home: const LogInScreen(),
        initialRoute: AppPages.INITIAL ,
        getPages: AppPages.routes
    );
  }
}