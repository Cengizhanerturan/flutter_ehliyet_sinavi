import 'package:flutter_ehliyet_sinavi/view/parking_rules/parking_rules_page_controller.dart';
import 'package:get/get.dart';

class ParkingRulesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ParkingRulesPageController(), permanent: true);
  }
}
