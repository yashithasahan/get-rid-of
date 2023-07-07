import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_rid_of/controller/home_controller.dart';
import 'package:get_rid_of/controller/timer_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HoldIt extends StatelessWidget {
  HoldIt({super.key});
  final timeController = Get.put(TimerController());
  final homeController = Get.put(HomeController());
  static TextStyle timeStyle = GoogleFonts.orbitron(
      color: Colors.black, fontSize: 100, fontWeight: FontWeight.w600);
  TextStyle timeStyleSecondry = GoogleFonts.orbitron(
      color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: homeController.isGoalSet.value ? width : 0,
      height: homeController.isGoalSet.value ? width * .8 : 0,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: homeController.isGoalSet.value ? 1 : 0,
        child: Column(
          children: [
            Text(
              "Great! Its been ${homeController.onGoingFor} Days\n Hold it for just",
              style: GoogleFonts.aBeeZee(
                  fontSize: 30, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          
            SizedBox(
              height: width * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    width: width * 0.3,
                    height: height * 0.2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeController.reamaingDays.toString(),
                            style: timeStyle,
                          ),
                          Text(
                            "Days",
                            style: timeStyleSecondry,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                  child: Center(
                    child: Obx(
                      () => timeController.indicator.value
                          ? Text(
                              ":",
                              style: timeStyle,
                            )
                          : Text(
                              " ",
                              style: timeStyle,
                            ),
                    ),
                  ),
                ),
           
             
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    width: width * 0.3,
                    height: height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          homeController.reamaingHours.toString(),
                          style: timeStyle,
                        ),
                        Text(
                          "Hours",
                          style: timeStyleSecondry,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
