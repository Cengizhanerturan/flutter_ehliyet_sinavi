import 'package:flutter_ehliyet_sinavi/view/current_information/current_information_page_controller.dart';
import 'package:get/get.dart';

class CurrentInformationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrentInformationPageController(), permanent: true);
  }
}
