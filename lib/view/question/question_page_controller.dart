import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/model/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionPageController extends GetxController with StateMixin {
  final String id;
  final QuestionType questionType;
  final int questionIndex;
  final bool isWrongQuestion;
  final QuestionModel? wrongQuestionModel;
  QuestionPageController({
    required this.questionType,
    required this.id,
    required this.questionIndex,
    this.isWrongQuestion = false,
    this.wrongQuestionModel,
  });

  var questionTrueCount = 0.obs;
  var questionFalseCount = 0.obs;
  var questionEmptyCount = 0.obs;

  List<QuestionModel> wrongQuestionsList = [];

  var questionPageIndex = 0.obs;
  var pageController = PageController();

  var selectedAnswer = ''.obs;
  var questionList = <QuestionModel>[].obs;

  var isLoading = false.obs;
  bool get checkIsLoading => isLoading.value;

  var canBack = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      if (isWrongQuestion) {
        if (wrongQuestionModel != null) {
          questionList.value = [wrongQuestionModel!];
          change(state, status: RxStatus.success());
        } else {
          change(state, status: RxStatus.error());
        }
      } else {
        questionList.value = await _databaseService.getQuestions(
            id: id, questionType: questionType);
        if (questionList.isEmpty) {
          change(state, status: RxStatus.empty());
        } else {
          change(state, status: RxStatus.success());
        }
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
