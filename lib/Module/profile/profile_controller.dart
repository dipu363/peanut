import 'dart:developer';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../service/api_endpoint.dart';
import '../../service/api_service.dart';
import '../auth/data/user_cache.dart';
import '../auth/data/user_model.dart';
import 'data/account_info_model.dart';

class ProfileController extends GetxController{

  Rx<AccountInfoModel> accountInfoModel = AccountInfoModel().obs;
  var phoneNo ="".obs;

  @override
  void onInit() async{
    super.onInit();

    var userid = UserCache.getUserId();
    var token = UserCache.getUserToken();
   await getAccountInformation(userid,token);
  }
Future<void> getAccountInformation(String id ,String token) async {

      final requestPayload = APIRequestParam(
          path: ApiEndPoints.profileModule.accountInfo,
          data: {"login": '$id', "token": '$token'}
      );
      log("requestPayload : ${requestPayload.toJson()}");

      try{
        await AppApiProvider.instance.post(requestPayload).then((response) {
          response.fold(
                  (error){
                log("User Error ${error.toString()}");

              },
                  (success)async{
                log("account info Data Fetched ${success.statusCode.toString()}");
                if(success.statusCode == 200) {
                  accountInfoModel.value = AccountInfoModel.fromJson(success.data);
                  print('account name ${accountInfoModel.value.name}');
                }else{
                  log("500 Internal server error. Access denied");
                  Get.offAllNamed(Routes.AUTH);
                }



              }
          );

        });

      }catch(e){
        Get.snackbar("error ", "error :$e");

      }



  }
Future<void> getPhoneNo(String id ,String token) async {

      final requestPayload = APIRequestParam(
          path: ApiEndPoints.profileModule.phoneNo,
          data: {"login": id, "token": token}
      );
      log("requestPayload : ${requestPayload.toJson()}");

      try{
        await AppApiProvider.instance.post(requestPayload).then((response) {
          response.fold(
                  (error){
                log("User Error ${error.toString()}");

              },
                  (success)async{
                log("account info Data Fetched ${success.statusCode.toString()}");
                if(success.statusCode == 200) {
                  phoneNo.value = success.data;
                }else{
                  log("500 Internal server error. Access denied");
                  Get.offAllNamed(Routes.AUTH);
                }



              }
          );

        });

      }catch(e){
        Get.snackbar("error ", "error :$e");

      }



  }
}