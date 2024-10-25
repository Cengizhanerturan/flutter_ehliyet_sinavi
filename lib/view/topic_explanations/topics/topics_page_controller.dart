import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ehliyet_sinavi/core/model/topic.dart';
import 'package:get/get.dart';

class TopicsPageController extends GetxController with StateMixin {
  var list = RxList<TopicModel>();
  var isLoadingMore = false.obs;
  var noData = false.obs;

  var limit = 10;
  DocumentSnapshot? lastDocument;

  final String topicID;

  TopicsPageController({required this.topicID});

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData({bool isLazyLoad = false}) async {
    try {
      if (isLazyLoad) {
        if (!noData.value) {
          isLoadingMore.value = true;
          var tempList = await _databaseService.getTopics(
              limit: limit,
              isLazyLoad: true,
              lastDocument: lastDocument,
              topicID: topicID);
          if (tempList.isNotEmpty) {
            list.addAll(tempList);
            if (tempList.length < limit) {
              noData.value = true;
            }
            isLoadingMore.value = false;
          } else {
            noData.value = true;
            isLoadingMore.value = false;
          }
        }
      } else {
        list.value = await _databaseService.getTopics(
            limit: limit, isLazyLoad: isLazyLoad, topicID: topicID);
      }
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
