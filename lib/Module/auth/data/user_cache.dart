import 'package:get_storage/get_storage.dart';

import 'user_model.dart';

class UserCache {
  static final _box = GetStorage();

  // Save user data to cache
  static Future<void> saveUserData(UserModel user) async {
    await _box.write('user', user.toJson().toString());
  }
  static Future<void> saveUserId(userId) async {
    await _box.write('userId',userId );
  }

  // Get user data from cache
  static UserModel? getUserData() {
    final userData = _box.read('user');
    if (userData != null) {
      return UserModel.fromJson(userData);
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
  static Future<void> clearUserData() async {
    await _box.remove('user');
  }
  static Future<void> clearUserId() async {
    await _box.remove('userId');
  }

  static bool isUserEmpty() {
    // Retrieve user data from cache
    UserModel? cachedUser = UserCache.getUserData();
    if (cachedUser != null) {
      return false;
    }
    return true;
  }

  static bool isSessionExpire() {
    // if (isUserEmpty()) {
    //   return true;
    // }
    UserModel? cachedUser = UserCache.getUserData();
    var userid = UserCache.getUserId();
    if (cachedUser == null) {
      return true;
    }

    // call others network for check session
    return false;
  }




}