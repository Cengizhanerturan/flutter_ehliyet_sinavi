import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topics/topics_page_controller.dart';
import 'package:get/get.dart';

class TopicsPageBinding extends Bindings {
  final String topicID;

  TopicsPageBinding({required this.topicID});

  @override
  void dependencies() {
    Get.put(TopicsPageController(topicID: topicID),
        tag: topicID, permanent: true);
  }
}
