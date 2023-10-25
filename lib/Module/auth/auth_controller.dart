

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{

  static AuthController get instance => Get.find<AuthController>();
  Rx<TextEditingController> emailVerifyController = TextEditingController().obs;
  Rx<TextEditingController> passWordController = TextEditingController().obs;

  var obscurePassword = true.obs;
  var isChecked = false.obs;

}