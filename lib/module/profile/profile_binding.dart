import 'package:get/get.dart';

import 'controller/trades_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TradesController());
  }

}