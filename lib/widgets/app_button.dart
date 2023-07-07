import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_rid_of/controller/home_controller.dart';
import 'package:get_rid_of/widgets/hold_it.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  AppButton({super.key});

  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.15,
      child: Stack(
        children: [
          Visibility(
            visible: homeController.isGoalSet.value,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  width: width * 0.7,
                  height: height * 0.05,
                  child: InkWell(
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    onTap: () {
                      homeController.removeGoal();
                    },
                    child: Center(
                      child: Text(
                        "Need to reset",
                        style: HoldIt.timeStyle
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: homeController.showResetWindow.value ? width * 0.9 : 0,
                height: homeController.showResetWindow.value ? height * 0.2 : 0,
                child: SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedOpacity(
                        duration: homeController.showResetWindow.value
                            ? const Duration(milliseconds: 400)
                            : const Duration(milliseconds: 0),
                        opacity: homeController.showResetWindow.value ? 1 : 0,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 200),
                          scale: homeController.showResetWindow.value ? 1 : 0,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Don`t worry lets try again :)",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                                width: width * 0.3,
                                height: height * 0.05,
                                child: InkWell(
                                  highlightColor: Colors.white,
                                  splashColor: Colors.white,
                                  onTap: () {
                                    homeController.isGoalSet.value = false;
                                    homeController.showResetWindow.value =
                                        false;
                                  },
                                  child: Center(
                                    child: Text(
                                      "Try again",
                                      style: HoldIt.timeStyle.copyWith(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    homeController.showResetWindow.value =
                                        false;
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ))
                            ],
                          )),
                        ),
                      ),
                    ),
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
