import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_rid_of/constant/assest.dart';
import 'package:get_rid_of/controller/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/hold_it.dart';
import '../widgets/reset_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: width,
            height: height,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: width * 0.2,
                  ),
                  Visibility(
                    visible: homeController.isGoalSet.value,
                    child: Column(
                      children: [
                        Text(
                          "Let`s go to your Goal",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Lottie.asset(trophy, width: width * 0.4),
                      ],
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: homeController.isGoalSet.value,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        width: width,
                        child: LinearPercentIndicator(
                          animation: true,
                          lineHeight: 15.0,
                          animationDuration: 2500,
                          percent: 1.0 - homeController.precentage.value,
                          center: Text(
                            "${((1 - homeController.precentage.value) * 100).toStringAsFixed(2)} %",
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          barRadius: const Radius.circular(45),
                          progressColor: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.1,
                  ),
                  Visibility(
                    visible: !homeController.isGoalSet.value,
                    child: Column(
                      children: [
                        Text(
                          "First Pick a Target Date",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Colors.black,
                          selectedTextColor: Colors.white,
                          onDateChange: (date) async {
                            homeController.endDate.value = date;
                            homeController.getDifference();
                            homeController.isGoalSet.value = true;
                            await homeController.saveDates();
                            // New date selected
                          },
                        ),
                      ],
                    ),
                  ),
                  HoldIt(),
                  AppButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
