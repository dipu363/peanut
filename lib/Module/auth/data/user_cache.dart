
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../../service/api_endpoint.dart';
import '../../../service/api_service.dart';
import 'user_model.dart';

class UserCache {
  static final _box = GetStorage();

  // Save user data to cache
  static Future<void> saveUserToken(userToken) async {
    await _box.write('userToken', userToken);
  }
  static Future<void> saveUserId(userId) async {
    await _box.write('userId',userId );
  }

  // Get user data from cache
  static dynamic? getUserToken() {
    final token = _box.read('userToken');
    if (token != null) {
      return token;

    } else {
      return null;
    }
  }
  static dynamic? getUserId() {
    final userId = _box.read('userId');
    if (userId != null) {
      return userId;
    } else {
      return null;
    }
  }

  // Clear user data from cache
  static Future<void> clearUserToken() async {
    await _box.remove('userToken');
  }
  static Future<void> clearUserId() async {
    await _box.remove('userId');
  }

  static bool isUserEmpty() {
    // Retrieve user data from cache
    var token = UserCache.getUserToken();
    if (token != null) {
      return false;
    }
    return true;
  }

  static Future<bool> isSessionExpire() async {
    var tokenStatus = true;
    UserModel? cachedUser = UserCache.getUserToken();
    var userid = UserCache.getUserId();
    if (cachedUser != null) {
      final requestPayload = APIRequestParam(
          path: ApiEndPoints.profileModule.accountInfo,
          data: {"login": '$userid', "token": '${cachedUser.token}'}
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
    }


    // call others network for check session
    return tokenStatus;
  }




}