import 'dart:developer';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../service/api_endpoint.dart';
import '../../../service/api_service.dart';
import '../../../utils/user_cache.dart';
import '../../auth/auth_controller.dart';
import '../data/open_trades_model.dart';


class TradesController extends GetxController{


  var openTrades = <OpenTrades>[].obs;
  var isTradesLoading = true.obs;
  var userid =  0.obs;
  var token =  ''.obs;
  var netProfit = 0.0.obs;


  var items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ].obs;
  Future<void> refreshData() async {
    // Simulate loading data for 2 seconds.
    await Future.delayed(const Duration(seconds: 2));

    // Replace this with your actual data fetching logic.
      // Update your data source here.
      items.value = [
        "New Item 1",
        "New Item 2",
        "New Item 3",
        "New Item 4",
        "New Item 5",
      ];

  }

  @override
  void onInit() async {
    super.onInit();
    userid.value =  (await UserCache.getUserId())!;
    token.value =  (await UserCache.getUserToken())!;
    await getOpenTrades();
  }

  Future<void> getOpenTrades() async {
    await Future.delayed(const Duration(seconds: 2));

    final requestPayload = APIRequestParam(
        path: ApiEndPoints.profileModule.openTrades,
        data: {"login": userid.value, "token": token.value});
    log("requestPayload : ${requestPayload.toJson()}");

    try {
      await AppApiProvider.instance.post(requestPayload).then((response) {
        response.fold((error) {
          log("response Error ${error.toString()}");
          isTradesLoading.value = false;
        }, (success) async {
          log("Open Trades Data Fetched ${success.statusCode.toString()}");
          if (success.statusCode == 200) {
            // if find response as List<dynamic> then convert to object in this way
            openTrades.clear();
            success.data.forEach((element) {
              openTrades.add(OpenTrades.fromJson(element));

            });
            netProfit.value= 0.0;
            for(int i = 0 ; i<openTrades.length; i++){
              var profite = openTrades[i].profit!;
              netProfit.value += profite ;
            }
            log('Open trades size  ${openTrades.length}');
            log('netprofit  ${netProfit.toStringAsFixed(2)}');
            isTradesLoading.value = false;
          } else {
            AuthController.instance.logOut();
            log("500 Internal server error. Access denied");
            Get.offAllNamed(Routes.AUTH);
            isTradesLoading.value = false;
          }
        });
      });
    } catch (e) {
      Get.snackbar("error ", "error :$e");
      isTradesLoading.value = false;
    }
  }

}