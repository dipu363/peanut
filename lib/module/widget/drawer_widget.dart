
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut/module/profile/open_trades_screen.dart';

import '../../routes/app_pages.dart';
import '../../utils/app_colors.dart';
import '../auth/auth_controller.dart';
import '../profile/controller/profile_controller.dart';
class DrawerWidget extends GetView<ProfileController> {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration:  BoxDecoration(
              color: primaryColor.withOpacity(.8)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                  ),
                 const  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name: ${controller.accountInfoModel.value.name} ',
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Country: ${controller.accountInfoModel.value.country} ',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ),

          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              Get.offAllNamed(Routes.PROFILE);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Open Trades'),
            onTap: () {
              Get.to(const OpenTradesScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
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
          ),
        ],
      ),
    );
  }
}