import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/service/user/user.dart';
import 'package:flutter_ehliyet_sinavi/view/trial_exam/trial_exam_page_controller.dart';
import 'package:get/get.dart';

class TrialExamModel {
  final String name;
  final String id;
  final RxBool locked;
  QuestionType questionType = QuestionType.TRIAL_EXAM;

  TrialExamModel({
    required this.name,
    required this.id,
    required this.locked,
  });

  factory TrialExamModel.fromJson(Map<String, dynamic> json) => TrialExamModel(
        name: json["name"],
        id: json["id"],
        locked: RxBool(json["locked"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "locked": locked,
      };

  static List<TrialExamModel> decoder(dynamic data, bool isLazyLoad) {
    try {
      List list = (data as List);
      List<TrialExamModel> tempList = [];
      for (var i = 0; i < list.length; i++) {
        if (Get.find<UserService>().user.value != null) {
          var unlockedIndex =
              Get.find<UserService>().user.value?.unlockedTrialExamIndex;
          if (isLazyLoad) {
            list[i]["locked"] =
                Get.find<TrialExamPageController>().list.length + i >
                    unlockedIndex!;
            tempList.add(TrialExamModel.fromJson(list[i]));
          } else {
            list[i]["locked"] = i > unlockedIndex!;
            tempList.add(TrialExamModel.fromJson(list[i]));
          }
        } else {
          list[i]["locked"] = true;
          tempList.add(TrialExamModel.fromJson(list[i]));
        }
      }
      return tempList;
    } catch (e) {
      rethrow;
    }
  }
}
