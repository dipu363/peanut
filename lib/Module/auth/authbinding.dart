import 'package:get/get.dart';
import 'package:peanut/Module/auth/auth_controller.dart';
import 'package:peanut/Module/auth/users_controller.dart';

import '../profile/profile_controller.dart';
import 'network_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.lazyPut<UsersController>(() => UsersController());
    Get.put<NetworkController>(NetworkController() ,permanent:true);
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}