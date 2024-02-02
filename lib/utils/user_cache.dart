
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../service/api_endpoint.dart';
import '../../../service/api_service.dart';

class UserCache {
 // static final _box = GetStorage();


  // Save user data to cache
  static Future<void> saveUserToken(userToken) async {
    final prefs = await SharedPreferences.getInstance();
   // await _box.write('userToken', userToken);
    prefs.setString('userToken', userToken);


  }
  static Future<void> saveUserId(userId) async {
    final prefs = await SharedPreferences.getInstance();
   // await _box.write('userId',userId );
    prefs.setString('userId',userId.toString());
  }

  // Get user data from cache
  static Future<String?> getUserToken() async{
    final prefs = await SharedPreferences.getInstance();
   // final token = _box.read('userToken');
    final token = prefs.getString('userToken');

    if (token != null) {
      return token;

    } else {
      return null;
    }
  }
  static Future<int?>getUserId() async{
    final prefs = await SharedPreferences.getInstance();
   // final userId = _box.read('userId');
    final userId = prefs.getString('userId');
    if (userId != null) {
      return int.parse(userId);
    } else {
      return null;
    }
  }

  // Clear user data from cache
  static Future<void> clearUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
  }
  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  static Future<bool> isUserEmpty() async {
    // Retrieve user data from cache
    var token = await UserCache.getUserToken();
    if (token != null) {
      return false;
    }
    return true;
  }

  static Future<bool> isSessionExpire() async {
    var tokenStatus = true;
    var token =  UserCache.getUserToken();
    var userid = UserCache.getUserId();
    final requestPayload = APIRequestParam(
        path: ApiEndPoints.profileModule.accountInfo,
        data: {"login": '$userid', "token":token}
    );
    log("requestPayload : ${requestPayload.toJson()}");

    try{
      await AppApiProvider.instance.post(requestPayload).then((response) {
        response.fold(
                (error){
              log("User Error ${error.toString()}");

            },
                (success)async{
              log("Login Data Fetched ${success.data.toString()}");
              tokenStatus = false;
            }
        );

      });

    }catch(e){
      Get.snackbar("error ", "error :$e");

    }


    // call others network for check session
    return tokenStatus;
  }




}