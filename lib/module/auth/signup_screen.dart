
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut/module/auth/users_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/style.dart';

import '../widget/common_elevated_button.dart';
import 'login_screen.dart';

class SignUpScreen extends GetView<UsersController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Form(
          key: controller.signUpFormKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: heading1,
                      ),
                      Text(
                        'Please create an account to manage your business.',
                        style: heading2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.businessNameTextController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter Business name';
                          } else {
                            return null;
                          }
                        },
                        style: editingTextStyle,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: 20,
                          ),
                          hintText: 'Business name',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.proprietorNameTextController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter Proprietor Name';
                          } else {
                            return null;
                          }
                        },
                        style: editingTextStyle,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: 20,
                          ),
                          hintText: 'Proprietor Name',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.cityTextController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter City';
                          } else {
                            return null;
                          }
                        },
                        style: editingTextStyle,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            size: 20,
                          ),
                          hintText: 'City',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.mobileTextController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter Phone no';
                          } else {
                            return null;
                          }
                        },
                        style: editingTextStyle,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 20,
                          ),
                          hintText: 'Phone No',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: controller.emailTextController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter Valid Email Address';
                          } else {
                            if (!value!.contains('@')) {
                              return 'Please Enter Valid Email Address with "@"';
                            } else {
                              return null;
                            }
                          }
                        },
                        style: editingTextStyle,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.passTextController,
                          style: editingTextStyle,
                          obscureText: controller.obscurePassword.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please Enter password';
                            } else {
                              if (value!.length < 8) {
                                return 'Password must be at least 8 characters';
                              } else {
                                return null;
                              }
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                size: 20,
                              ),
                              helperText: "",
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    if (controller.obscurePassword.value) {
                                      controller.obscurePassword.value = false;
                                    } else {
                                      controller.obscurePassword.value = true;
                                    }
                                  },
                                  icon: Icon(controller.obscurePassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              errorText:
                                  'Password must be at least 8 characters'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: subtitleTextStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.off(() => const LogInScreen());
                              },
                              child: Text(
                                'LogIn',
                                style: subtitleTextStyle.copyWith(
                                    color: primaryColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonElevatedButton(
                      title: 'Create Account',
                      onTap: () {
                        if (controller.signUpFormKey.currentState!.validate()) {
                            if (kDebugMode) {
                              print('user create successful');
                            }

                        }
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
