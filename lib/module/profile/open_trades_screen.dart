import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut/utils/app_colors.dart';

import 'controller/trades_controller.dart';

class OpenTradesScreen extends GetView<TradesController> {
  const OpenTradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getOpenTrades();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Trades'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Net Profit    ${controller.netProfit.value.toStringAsFixed(2).toString()}',style: const TextStyle(fontSize: 24 ,color: Colors.white),),
                  ],
                ),
              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: controller.getOpenTrades,
                  child: ListView.builder(
                    itemCount: controller.openTrades.length,
                    itemBuilder: (context, index) {
                      return openTradesCard(controller, index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget openTradesCard(controller, index) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
/*        "currentPrice": 1845.68,
          "comment": null,
          "digits": 2,
          "login": 2088888,
          "openPrice": 4732.58,
          "openTime": "2021-11-08T06:35:33",
          "profit": -28.87,
          "sl": 0.0,
          "swaps": 0.0,
          "symbol": "#Ethereum",
          "tp": 0.0,
          "ticket": 1386773321,
          "type": 0,
          "volume": 0.01*/
          Container(

            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color: Colors.green.withOpacity(.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ID :${controller.openTrades[index].ticket.toString()}",
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Date :${controller.openTrades[index].openTime.toString()}",
                    style:
                        const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User ID :${controller.openTrades[index].login.toString()}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Type :${controller.openTrades[index].type.toString()}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Symbol : ${controller.openTrades[index].symbol.toString()}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Current Price : ${controller.openTrades[index].currentPrice.toString()}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Open Price : ${controller.openTrades[index].openPrice.toString()}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Profit : ${controller.openTrades[index].profit.toString()}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Volume : ${controller.openTrades[index].volume.toString()}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )

        ],
      ),
    ),
  );
}
