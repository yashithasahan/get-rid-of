import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find<HomeController>();

  RxBool isGoalSet = false.obs;
  RxBool showResetWindow = false.obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  RxInt onGoingFor = 0.obs;
  DateTime now = DateTime.now();
  RxDouble precentage = 0.0.obs;

  @override
  void onInit() async {
    await getDates();

    super.onInit();
  }

  RxInt reamaingDays = 0.obs;
  RxInt reamaingHours = 0.obs;
  getDifference() {
    Duration difference = endDate.value.difference(now);

    Duration intialDifference = endDate.value.difference(startDate.value);
    Duration onGoing = now.difference(startDate.value);
    onGoingFor.value = onGoing.inDays;
    precentage.value =
        (difference.inSeconds.toInt() / intialDifference.inSeconds.toInt());
    reamaingDays.value = difference.inDays;
    reamaingHours.value = (difference.inHours - reamaingDays * 24).toInt();
  }

  Future<void>? saveDates() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String startDateSaved = startDate.value.toIso8601String();
    String endDateSaved = endDate.value.toIso8601String();

    await pref.setString('startDate', startDateSaved);
    await pref.setString('endDate', endDateSaved);
    await pref.setBool('isGaolSet', true);
    precentage.value = 1;
  }

  Future<void> getDates() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? startDateGet = pref.getString('startDate');
    String? endDateGet = pref.getString('endDate');
    bool? isGoalSetGet = pref.getBool('isGaolSet');

    if (isGoalSetGet == true) {
      isGoalSet.value = true;
      startDate.value = DateTime.parse(startDateGet!);
      endDate.value = DateTime.parse(endDateGet!);
      getDifference();
    }
  }

  Future<void> removeGoal() async {
    showResetWindow.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isGaolSet', false);
  }
}
