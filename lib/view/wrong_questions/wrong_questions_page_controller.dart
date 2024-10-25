import 'package:flutter_ehliyet_sinavi/core/model/question.dart';
import 'package:flutter_ehliyet_sinavi/core/service/user/user.dart';
import 'package:get/get.dart';

class WrongQuestionsPageController extends GetxController with StateMixin {
  final _userService = Get.find<UserService>();
  var list = <QuestionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    try {
      if (_userService.user.value != null) {
        list.value = _userService.user.value!.wrongQuestionsList;
      } else {
        list.value = [];
      }

      if (list.isNotEmpty) {
        change(state, status: RxStatus.success());
      } else {
        change(state, status: RxStatus.empty());
      }
    } catch (e) {
      change(state, status: RxStatus.error());
    }
  }

  void updateList({required List<QuestionModel> questionList}) {
    try {
      list.value = questionList;
      if (list.isNotEmpty) {
        change(state, status: RxStatus.success());
      } else {
        change(state, status: RxStatus.empty());
      }
    } catch (e) {
      change(state, status: RxStatus.error());
    }
  }

  void onError() {
    change(state, status: RxStatus.loading());
    getData();
  }
}
