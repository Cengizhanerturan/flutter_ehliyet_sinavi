import 'package:flutter_ehliyet_sinavi/view/trial_exam/trial_exam_page_controller.dart';
import 'package:get/get.dart';

class TrialExamPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrialExamPageController(), permanent: true);
  }
}
