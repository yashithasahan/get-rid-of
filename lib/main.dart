import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_rid_of/controller/home_controller.dart';
import 'package:get_rid_of/screens/menu.dart';

void main() {
  runApp(const MyApp());
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Rid of',
      theme: ThemeData(

        primarySwatch: Colors.amber,
      ),
      home: const MenuScreen(),
    );
  }
}
