import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/dashboard.dart';
import 'package:myapp/ui/login.dart';
import 'package:myapp/ui/widgets/akili_btn.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Color.fromRGBO(253, 232, 209, 1)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Image
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/banner2.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //Text section
            Column(
              children: [
                Text(
                  "Take Care of your Mental.",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Are you feeling overwhelmed by anxiety and stress? Our app will help you find calm and balance in your day to day life.",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            //Button section
            AkiliButton(
              text: "Get Started",
              onPressed: () async {
                if ((await ParseUser.currentUser()) == null) {
                  Get.to(() => Login());
                } else {
                  Get.to(() => Dashboard());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
