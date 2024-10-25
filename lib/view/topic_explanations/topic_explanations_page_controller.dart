import 'package:flutter_ehliyet_sinavi/core/model/topic_explanations.dart';
import 'package:get/get.dart';

class TopicExplanationsPageController extends GetxController with StateMixin {
  var list = RxList<TopicExplanationsModel>();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      list.value = await _databaseService.getTopicExplanations();
      if (list.isEmpty) {
        change(state, status: RxStatus.empty());
      } else {
        change(state, status: RxStatus.success());
      }
    } catch (e) {
      change(state, status: RxStatus.error());
    }
  }

  Future<void> onError() async {
    change(state, status: RxStatus.loading());
    await getData();
  }
}
