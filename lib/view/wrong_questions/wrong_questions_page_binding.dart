import 'package:flutter_ehliyet_sinavi/view/wrong_questions/wrong_questions_page_controller.dart';
import 'package:get/get.dart';

class WrongQuestionsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WrongQuestionsPageController());
  }
}
