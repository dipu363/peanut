
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class UsersController extends GetxController{
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController businessNameTextController = TextEditingController();
  TextEditingController proprietorNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController mobileTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();

  var obscurePassword = true.obs;


}