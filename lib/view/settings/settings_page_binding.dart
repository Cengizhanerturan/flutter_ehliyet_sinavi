import 'package:flutter_ehliyet_sinavi/view/settings/settings_page_controller.dart';
import 'package:get/get.dart';

class SettingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsPageController());
  }
}
