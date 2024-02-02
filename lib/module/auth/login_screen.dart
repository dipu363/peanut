
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut/module/auth/signup_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/style.dart';
import 'auth_controller.dart';

class LogInScreen extends GetView<AuthController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back ',
                          style: heading1,
                        ),
                        Text(
                          'Please login to get your access.',
                          style: heading2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: controller.emailVerifyController.value,
                          style: editingTextStyle,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please Enter user id';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              size: 20,
                            ),
                            hintText: 'User ID',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(()=>TextFormField(

                          controller: controller.passWordController.value,
                          style: editingTextStyle,
                          obscureText: controller.obscurePassword.value,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please Enter password';
                            } else {
                              return null;
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
                          ),
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Obx(()=> Checkbox(
                                      activeColor: primaryColor,
                                      checkColor: white,
                                      value: controller.isChecked.value,
                                      onChanged: (value) =>
                                      controller.isChecked.value =value!
                                    /*setState(() => isChecked = value!)*/
                                  ),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: editingTextStyle,
                                  )
                                ]),
                            TextButton(
                                onPressed: () {
                                 // Get.to(() => const ResetPasswordScreen());
                                },
                                child: Text(
                                  'Forget Password?',
                                  style:
                                  editingTextStyle.copyWith(color: primaryColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: editingTextStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.off(() => const SignUpScreen());
                              },
                              child: Text(
                                'Register',
                                style: subtitleTextStyle.copyWith(
                                    color: primaryColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(()=>
                      Container(
                        decoration: BoxDecoration(
                            color: controller.isChecked.value ? primaryColor : blackColor.withOpacity(.3),
                            border: controller.isChecked.value
                                ? Border.all(color: primaryColor)
                                : Border.all(color: blackColor.withOpacity(.3)),
                            borderRadius: BorderRadius.circular(6)),
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            controller.isChecked.value ? primaryColor : blackColor.withOpacity(.3),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(00.0),
                            ),
                          ),
                          onPressed: () async{
                            if(controller.isChecked.value){
                              if (loginFormKey.currentState!.validate()) {
                                String userName = controller.emailVerifyController.value.text;
                                String pass = controller.passWordController.value.text;
                                await controller.userLogin(userName,pass);
                              }
                            }else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content:
                                const Text('please check remember me'),
                                  backgroundColor:red.withOpacity(.2),

                                ),

                              );
                            }


                          },
                          child: Text(
                            'LogIn',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: controller.isChecked.value ? white : grayColor,
                                fontSize: 16,
                                letterSpacing: .1,
                                fontFamily: 'SFProDisplay'),
                          ),
                        ),
                      ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
