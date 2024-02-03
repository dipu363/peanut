import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/user_cache.dart';
import '../auth/auth_controller.dart';
import '../widget/drawer_widget.dart';
import 'controller/profile_controller.dart';


class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAccountInformation();
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
         // size: 40,//change size on your need
          color: white,//change color on your need
        ),
        backgroundColor: primaryColor.withOpacity(.8),
        title: const Text('Account Info',style: TextStyle(color: white),),
        centerTitle: false,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded,color: white,),
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: white,
                  barrierDismissible: false,
                  title: 'Are you sure?',
                  content: const Text('Log out your account'),
                  contentPadding: const EdgeInsets.all(10),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: white,
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: white, elevation: 0),
                            child: const Text('Cancel'),
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: white,
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            onPressed: () {
                              AuthController.instance.logOut();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: white, elevation: 0),
                            child: const Text('Log Out'),
                          ),
                        ),
                      ],
                    ),
                  ],

                );
              },
          )
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
                        /*Text(
                          '${controller.phoneNo.value} ',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),*/
                        ElevatedButton(
                            onPressed: () async {
                              var userid =(await UserCache.getUserId())!;
                              var token = (await UserCache.getUserToken())!;
                              await controller.getPhoneNo(userid, token);
                              Get.defaultDialog(
                                backgroundColor: white,
                                barrierDismissible: false,
                                title: 'Last 4 digit Phone No',
                                content: Text('Last 4 digit of your Phone Number \n${controller.phoneNo.value} '),
                                contentPadding: const EdgeInsets.all(10),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: white,
                                            border: Border.all(color: white),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: white, elevation: 0),
                                          child: const Text('Back'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],

                              );
                            },
                            child: const Text('Get last 4 Digit of number')),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}


