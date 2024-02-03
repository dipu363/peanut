import 'package:get/get.dart';

import 'controller/profile_controller.dart';
import 'controller/trades_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(TradesController());
  }

}