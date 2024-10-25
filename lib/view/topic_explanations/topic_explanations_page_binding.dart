import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topic_explanations_page_controller.dart';
import 'package:get/get.dart';

class TopicExplanationsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TopicExplanationsPageController());
  }
}
