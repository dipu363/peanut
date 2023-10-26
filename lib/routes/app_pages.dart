import 'package:get/get.dart';
import 'package:peanut/Module/auth/login_screen.dart';
import 'package:peanut/Module/profile/profile_screen.dart';

import '../Module/auth/authbinding.dart';
import '../Module/profile/profile_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [

    GetPage(
      name: _Paths.AUTH,
      page: () => const LogInScreen(),
      binding: AuthBinding(),
    ),GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
