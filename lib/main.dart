import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/onboarding.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<void> main() async {
  const keyApplicationId = '1bASs7gmD9PIgpm1UvvIkwGyYqw1BPad1ieD8004';
  const keyClientKey = 'IEeV5iUvVVUPWFbyMawvLUA3v85hCWGzT1Rr49ie';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Onboarding(),
    );
  }
}
