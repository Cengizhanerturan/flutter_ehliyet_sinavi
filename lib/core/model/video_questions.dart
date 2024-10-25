import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/service/user/user.dart';
import 'package:flutter_ehliyet_sinavi/view/video_questions/video_questions_page_controller.dart';
import 'package:get/get.dart';

class VideoQuestionsModel {
  final String name;
  final String id;
  final RxBool locked;
  QuestionType questionType = QuestionType.VIDEO_QUESTION;

  VideoQuestionsModel({
    required this.name,
    required this.id,
    required this.locked,
  });

  factory VideoQuestionsModel.fromJson(Map<String, dynamic> json) =>
      VideoQuestionsModel(
        name: json["name"],
        id: json["id"],
        locked: RxBool(json["locked"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "locked": locked,
      };

  static List<VideoQuestionsModel> decoder(dynamic data, bool isLazyLoad) {
    try {
      List list = (data as List);
      List<VideoQuestionsModel> tempList = [];
      for (var i = 0; i < list.length; i++) {
        if (Get.find<UserService>().user.value != null) {
          var unlockedIndex =
              Get.find<UserService>().user.value?.unlockedVideoQuestionIndex;
          if (isLazyLoad) {
            list[i]["locked"] =
                Get.find<VideoQuestionsPageController>().list.length + i >
                    unlockedIndex!;
            tempList.add(VideoQuestionsModel.fromJson(list[i]));
          } else {
            list[i]["locked"] = i > unlockedIndex!;
            tempList.add(VideoQuestionsModel.fromJson(list[i]));
          }
        } else {
          list[i]["locked"] = true;
          tempList.add(VideoQuestionsModel.fromJson(list[i]));
        }
      }
      return tempList;
    } catch (e) {
      rethrow;
    }
  }
}
