import 'package:flutter/material.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/ui/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: IlustrationPage(
        title: 'Find your favorite food',
        subtitle: 'Lets discover the best food in your city',
        picturepath: 'assets/love_burger.png',
        buttontap1: () {},
        buttontitle1: "Find best meal",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
