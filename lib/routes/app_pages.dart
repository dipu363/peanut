import 'package:get/get.dart';
import '../module/auth/auth_binding.dart';
import '../module/auth/login_screen.dart';
import '../module/profile/profile_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [

    GetPage(
      name: _Paths.AUTH,
      page: () => const LogInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileScreen(),

    ),
  ];
}
