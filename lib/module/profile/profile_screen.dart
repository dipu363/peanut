import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/user_cache.dart';
import '../auth/auth_controller.dart';
import 'controller/profile_controller.dart';
import 'open_trades_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAccountInformation();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Info'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                AuthController.instance.logOut();
              },
              child: const Text('Log Out'))
        ],
      ),
      body: Obx(
        () => controller.isProfileLoading.value
            ? const Center(
                child: SizedBox(
                    height: 40, width: 40, child: CircularProgressIndicator()))
            : Column(
                children: [
                  Container(
                      color: primaryColor.withOpacity(.7),
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child: Icon(
                                Icons.person,
                                size: 70,
                              ),
                            ),
                            Text(
                              'Name: ${controller.accountInfoModel.value.name} ',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              'Country: ${controller.accountInfoModel.value.country} ',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Balance ${controller.accountInfoModel.value.balance.toString()} ',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.green),
                        ),
                        Text(
                          'Current Trades Count ${controller.accountInfoModel.value.currentTradesCount.toString()} ',
                          style: const TextStyle(
                              fontSize: 16, color: primaryColor),
                        ),
                        Text(
                          'Current Trades Volume ${controller.accountInfoModel.value.currentTradesVolume.toString()} ',
                          style: const TextStyle(
                              fontSize: 16, color: primaryColor),
                        ),
                        Text(
                          'Total Trades Count ${controller.accountInfoModel.value.totalTradesCount.toString()} ',
                          style: const TextStyle(
                              fontSize: 16, color: primaryColor),
                        ),
                        Text(
                          'Total Trades Volume ${controller.accountInfoModel.value.totalTradesVolume.toString()} ',
                          style: const TextStyle(
                              fontSize: 16, color: primaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${controller.phoneNo.value} ',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              var userid =(await UserCache.getUserId())!;
                              var token = (await UserCache.getUserToken())!;
                              await controller.getPhoneNo(userid, token);
                            },
                            child: const Text('Get last 4 Digit of number')),
                        ElevatedButton(
                            onPressed: () async {
                              Get.to(const OpenTradesScreen());
                            },
                            child: const Text('Open Trades')),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
