import 'package:flutter_ehliyet_sinavi/view/video_questions/video_questions_page_controller.dart';
import 'package:get/get.dart';

class VideoQuestionsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VideoQuestionsPageController(), permanent: true);
  }
}
