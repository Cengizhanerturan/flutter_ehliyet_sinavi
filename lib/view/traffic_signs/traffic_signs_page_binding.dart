import 'package:flutter_ehliyet_sinavi/view/traffic_signs/traffic_signs_page_controller.dart';
import 'package:get/get.dart';

class TrafficSignsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrafficSignsPageController());
  }
}
