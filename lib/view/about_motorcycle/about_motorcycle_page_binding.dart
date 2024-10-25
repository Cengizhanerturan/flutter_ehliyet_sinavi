import 'package:flutter_ehliyet_sinavi/view/about_motorcycle/about_motorcycle_page_controller.dart';
import 'package:get/get.dart';

class AboutMotorcyclePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutMotorcyclePageController(), permanent: true);
  }
}
