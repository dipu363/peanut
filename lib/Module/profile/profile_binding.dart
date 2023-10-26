import 'package:get/get.dart';
import 'package:peanut/Module/profile/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}