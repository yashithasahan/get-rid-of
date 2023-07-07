import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_rid_of/controller/timer_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTimer extends StatelessWidget {
  AppTimer({super.key});
  final timerController = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: height * 0.08,
      child: Obx(
        () => DefaultTextStyle(
          style: GoogleFonts.aBeeZee(fontSize: 30, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" day ${timerController.days.value.toString()}"),
              Text(" hours ${timerController.hours.value.toString()}"),
              Text(" min ${timerController.minutes.value.toString()}"),
              Text(" sec ${timerController.seconds.value.toString()}"),

              //Text(timerController.seconds.value.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
