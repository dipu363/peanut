import 'dart:developer';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../service/api_endpoint.dart';
import '../../../service/api_service.dart';
import '../../../utils/user_cache.dart';
import '../../auth/auth_controller.dart';
import '../data/account_info_model.dart';



class ProfileController extends GetxController {
  Rx<AccountInfoModel> accountInfoModel = AccountInfoModel().obs;
  var phoneNo = "".obs;
  var isProfileLoading = true.obs;
  var isNumberLoading = true.obs;
  var userid =  0.obs;
  var token =  ''.obs;
  @override
  void onInit() async {
    super.onInit();
    userid.value =  (await UserCache.getUserId())!;
    token.value =  (await UserCache.getUserToken())!;
    await getAccountInformation();
  }

  Future<void> getAccountInformation() async {
    await Future.delayed(const Duration(seconds: 2));

    final requestPayload = APIRequestParam(
        path: ApiEndPoints.profileModule.accountInfo,
        data: {"login": userid.value, "token": token.value});
    log("requestPayload : ${requestPayload.toJson()}");

    try {
      await AppApiProvider.instance.post(requestPayload).then((response) {
        response.fold((error) {
          log("User Error ${error.toString()}");
          isProfileLoading.value = false;
        }, (success) async {
          log("account info Data Fetched ${success.statusCode.toString()}");
          if (success.statusCode == 200) {
            accountInfoModel.value = AccountInfoModel.fromJson(success.data);
            log('account name ${accountInfoModel.value.name}');
            isProfileLoading.value = false;
          } else {
            AuthController.instance.logOut();
            log("500 Internal server error. Access denied");
            Get.offAllNamed(Routes.AUTH);
            isProfileLoading.value = false;
          }
        });
      });
    } catch (e) {
      Get.snackbar("error ", "error :$e");
      isProfileLoading.value = false;
    }
  }

  Future<void> getPhoneNo(int id, String token) async {
    await Future.delayed(const Duration(seconds: 2));
    final requestPayload = APIRequestParam(
        path: ApiEndPoints.profileModule.phoneNo,
        data: {"login": id, "token": token});
    log("requestPayload : ${requestPayload.toJson()}");
    try {
      await AppApiProvider.instance.post(requestPayload).then((response) {
        response.fold((error) {
          log("User Error ${error.toString()}");
          isProfileLoading.value = false;
        }, (success) async {
          log("account info Data Fetched ${success.statusCode.toString()}");
          if (success.statusCode == 200) {
            phoneNo.value = success.data;
          } else {
            AuthController.instance.logOut();
            log("500 Internal server error. Access denied");
            Get.offAllNamed(Routes.AUTH);
          }
          isProfileLoading.value = false;
        });
      });
    } catch (e) {
      Get.snackbar("error ", "error :$e");
      isProfileLoading.value = false;
    }
  }
}
