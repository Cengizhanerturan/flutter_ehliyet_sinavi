import 'package:flutter_ehliyet_sinavi/view/driving_test/driving_test_page_controller.dart';
import 'package:get/get.dart';

class DrivingTestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DrivingTestPageController(), permanent: true);
  }
}
