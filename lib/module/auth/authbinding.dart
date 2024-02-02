import 'package:get/get.dart';
import '../common/network_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController() ,permanent:true);

  }

}