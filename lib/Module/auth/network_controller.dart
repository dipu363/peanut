
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:peanut/Module/auth/data/user_cache.dart';
import 'package:peanut/Module/auth/data/user_model.dart';
import '../../no_internet_connection_screen.dart';

class NetworkController extends GetxController{
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {

    if (connectivityResult == ConnectivityResult.none) {
      Get.to(const NoInternetConnectionScreen());
    } else {
      Get.back();
    }
  }



}