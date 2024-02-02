import 'package:get/get.dart';
import 'package:peanut/module/auth/users_controller.dart';

import '../common/network_controller.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController() ,permanent:true);
    Get.put<AuthController>( AuthController());
    Get.put<UsersController>( UsersController());
  }

}