import 'package:get/get.dart';
import 'package:peanut/Module/profile/profile_controller.dart';
import 'package:peanut/Module/profile/trades_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
    Get.put(TradesController());
  }

}