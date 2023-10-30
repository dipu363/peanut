
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut/Module/auth/auth_controller.dart';
import 'package:peanut/Module/profile/open_trades_screen.dart';
import 'package:peanut/Module/profile/profile_controller.dart';
import 'package:peanut/utils/app_colors.dart';

import '../auth/data/user_cache.dart';
class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Account Info'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: (){
            AuthController.instance.logOut();
          }, child: const Text('Log Out'))
        ],
      ),
      body: Obx(()=>
         Column(
          children: [
            Container(
              color: Colors.red.withOpacity(.2),
              height: 150,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person,size: 70,),
                    ),
                    Text('Name: ${controller.accountInfoModel.value.name} ',style: const TextStyle(fontSize: 20,color: Colors.red),),
                    Text('Country: ${controller.accountInfoModel.value.country} ',style: const TextStyle(fontSize: 12,color: primaryColor),),
                  ],
                ),
              )

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Current Balance: ${controller.accountInfoModel.value.balance.toString()} ',style: const TextStyle(fontSize: 24,color: Colors.green),),
                  Text('Current Trades Count: ${controller.accountInfoModel.value.currentTradesCount.toString()} ',style: const TextStyle(fontSize: 16,color: primaryColor),),
                  Text('Current Trades Volume: ${controller.accountInfoModel.value.currentTradesVolume.toString()} ',style: const TextStyle(fontSize: 16,color: primaryColor),),
                  Text('Total Trades Count: ${controller.accountInfoModel.value.totalTradesCount.toString()} ',style: const TextStyle(fontSize: 16,color: primaryColor),),
                  Text('Total Trades Volume: ${controller.accountInfoModel.value.totalTradesVolume.toString()} ',style: const TextStyle(fontSize: 16,color: primaryColor),),
                  const SizedBox(height: 20,),
                  Text('${controller.phoneNo.value} ',style: const TextStyle(fontSize: 20,),),
                  ElevatedButton(onPressed: ()async{
                    var userid = UserCache.getUserId();
                    var token = UserCache.getUserToken();
                    await controller.getPhoneNo(userid,token);
                  }, child: const  Text('Get last 4 Digit of number')),

                  ElevatedButton(onPressed: ()async{
                  Get.to(const OpenTradesScreen());
                  },
                      child: const  Text('Open Trades')),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
