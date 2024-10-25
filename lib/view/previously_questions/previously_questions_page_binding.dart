import 'package:flutter_ehliyet_sinavi/view/previously_questions/previously_questions_page_controller.dart';
import 'package:get/get.dart';

class PreviouslyQuestionsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreviouslyQuestionsPageController(), permanent: true);
  }
}
