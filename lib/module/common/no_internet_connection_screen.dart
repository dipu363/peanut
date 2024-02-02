
import 'package:flutter/material.dart';
import 'package:peanut/utils/style.dart';
class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            Expanded(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/noInternetConnection.png',height: 320,width: 260,),
                    const SizedBox(height: 40,),
                    Text('No Internet Connection' ,style: titleTextStyle,),
                    const SizedBox(height: 10,),
                    Text('Your network is unavailable check you data or wifi connectivity' ,style: subtitleTextStyle,textAlign: TextAlign.center,),

                  ],
                )
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
