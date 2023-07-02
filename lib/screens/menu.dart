import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_rid_of/widgets/hold_it.dart';
import 'package:lottie/lottie.dart';

import '../constant/assest.dart';
import 'home.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 216, 231, 255),
            child: Lottie.asset(background, height: height * 1.1),
          ),
          Center(
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Lottie.asset(
                    releafe,
                    width: width * 0.4,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                    child: SizedBox(
                      width: width * 0.4,
                      height: width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Get Rid It",
                              style: HoldIt.timeStyle.copyWith(fontSize: 20),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
