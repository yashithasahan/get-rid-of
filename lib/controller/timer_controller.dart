import 'dart:async';

import 'package:get/get.dart';
import 'package:get_rid_of/controller/home_controller.dart';

class TimerController extends GetxController {
  static TimerController get find => Get.find();
  final homeController = Get.put(HomeController());
  Timer? _timer;
  RxBool indicator = true.obs;
  RxInt seconds = 0.obs;
  RxInt minutes = 0.obs;
  RxInt hours = 0.obs;
  RxInt days = 0.obs;

  @override
  void onInit() {
    startTimer();
    setTimer();
    indicationRun();
    super.onInit();
  }

  void setTimer() {
    days.value = homeController.onGoingForDureation.value.inDays;
    hours.value = homeController.onGoingForDureation.value.inHours % 24;
    minutes.value = homeController.onGoingForDureation.value.inHours % (60);
    seconds.value = homeController.onGoingForDureation.value.inMinutes % (60);
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds.value++;
      indicator.value = !indicator.value;

      if (seconds.value == 60) {
        seconds.value = 0;
        minutes.value++;
        if (minutes.value == 60) {
          minutes.value = 0;
          hours.value++;
          if (hours.value == 24) {
            hours.value = 0;
            days.value++;
          }
        }
      }
    });
  }

  void indicationRun() {
    //indicationRun();
  }
}
