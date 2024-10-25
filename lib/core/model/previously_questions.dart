import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/service/user/user.dart';
import 'package:flutter_ehliyet_sinavi/view/previously_questions/previously_questions_page_controller.dart';
import 'package:get/get.dart';

class PreviouslyQuestionsModel {
  final String name;
  final String id;
  final RxBool locked;
  QuestionType questionType = QuestionType.PREVIOUSLY_QUESTION;

  PreviouslyQuestionsModel({
    required this.name,
    required this.id,
    required this.locked,
  });

  factory PreviouslyQuestionsModel.fromJson(Map<String, dynamic> json) =>
      PreviouslyQuestionsModel(
        name: json["name"],
        id: json["id"],
        locked: RxBool(json["locked"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "locked": locked,
      };

  static List<PreviouslyQuestionsModel> decoder(dynamic data, bool isLazyLoad) {
    try {
      List list = (data as List);
      List<PreviouslyQuestionsModel> tempList = [];
      for (var i = 0; i < list.length; i++) {
        if (Get.find<UserService>().user.value != null) {
          var unlockedIndex = Get.find<UserService>()
              .user
              .value
              ?.unlockedPreviouslyQuestionIndex;
          if (isLazyLoad) {
            list[i]["locked"] =
                Get.find<PreviouslyQuestionsPageController>().list.length + i >
                    unlockedIndex!;
            tempList.add(PreviouslyQuestionsModel.fromJson(list[i]));
          } else {
            list[i]["locked"] = i > unlockedIndex!;
            tempList.add(PreviouslyQuestionsModel.fromJson(list[i]));
          }
        } else {
          list[i]["locked"] = true;
          tempList.add(PreviouslyQuestionsModel.fromJson(list[i]));
        }
      }
      return tempList;
    } catch (e) {
      rethrow;
    }
  }
}
