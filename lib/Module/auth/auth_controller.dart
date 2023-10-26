

import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:peanut/service/api_service.dart';

import '../../routes/app_pages.dart';
import '../../service/api_endpoint.dart';
import 'data/user_cache.dart';
import 'data/user_model.dart';

class AuthController extends GetxController{

  static AuthController get instance => Get.find<AuthController>();
  Rx<TextEditingController> emailVerifyController = TextEditingController().obs;
  Rx<TextEditingController> passWordController = TextEditingController().obs;
  late Rx<bool> result;
  late Rx<String> userToken;
  var obscurePassword = true.obs;
  var isChecked = false.obs;

 Future<void> userLogin(username,password) async{
   final requestPayload = APIRequestParam(
       path: ApiEndPoints.authModule.login,
       data: {"login": '$username', "password": '$password'}
   );
   log("user Data Payload : ${requestPayload.toJson()}");

   try{
     await AppApiProvider.instance.post(requestPayload).then((response) {
       response.fold(
               (error){
                 log("User Error ${error.toString()}");
                 Get.snackbar("error ", "Login info not match");
               },
               (success)async{
                 log("Login Data Fetched ${success.data.toString()}");
                 UserModel user = UserModel.fromJson(success.data);

                 await UserCache.clearUserData();
                 await UserCache.clearUserId();
                 await UserCache.saveUserData(user);
                 await UserCache.saveUserId(username);
                 log("STORE USER DATA ${await UserCache.getUserId()} ");
                   Get.offAllNamed(Routes.PROFILE);
               }
       );

     });

   }catch(e){
     Get.snackbar("error ", "error :$e");
   }



 }
  Future<void> logOut() async {
    await UserCache.clearUserData();
    await UserCache.clearUserId();
      Get.offAllNamed(Routes.AUTH);

  }
}