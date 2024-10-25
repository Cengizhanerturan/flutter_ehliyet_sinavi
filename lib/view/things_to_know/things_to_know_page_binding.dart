import 'package:flutter_ehliyet_sinavi/view/things_to_know/things_to_know_page_controller.dart';
import 'package:get/get.dart';

class ThingsToKnowPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThingsToKnowPageController(), permanent: true);
  }
}
