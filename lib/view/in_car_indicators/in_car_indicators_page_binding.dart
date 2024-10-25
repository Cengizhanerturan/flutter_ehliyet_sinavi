import 'package:flutter_ehliyet_sinavi/view/in_car_indicators/in_car_indicators_page_controller.dart';
import 'package:get/get.dart';

class InCarIndicatorsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InCarIndicatorsPageController());
  }
}
