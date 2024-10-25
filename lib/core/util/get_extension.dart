import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/model/driving_test.dart';
import 'package:flutter_ehliyet_sinavi/core/model/question.dart';
import 'package:flutter_ehliyet_sinavi/core/model/topic_explanations.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_complete.dart/question_complete_page.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_complete.dart/question_complete_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_page.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topics/topics_page.dart';
import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topics/topics_page_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension CustomGetExtesion on GetInterface {
  Future<void> toTopicsPage({required TopicExplanationsModel model}) async {
    await Get.to(
      () => TopicsPage(topicID: model.id, title: model.name),
      binding: TopicsPageBinding(topicID: model.id),
      routeName: 'topics_page_${model.id}',
    );
  }

  Future<void> toDrivingTestDetailsPage(
      {required DrivingTestModel model}) async {
    await Get.to(
      () => TopicsPage(topicID: model.id, title: model.name),
      binding: TopicsPageBinding(topicID: model.id),
      routeName: 'topics_page_${model.id}',
    );
  }

  Future<void> toQuestionPage({
    required String id,
    required QuestionType questionType,
    required int questionIndex,
    bool isWrongQuestion = false,
    QuestionModel? wrongQuestionModel,
  }) async {
    var tag = UniqueKey().toString();
    await Get.to(
      () => QuestionPage(
        controllerTag: tag,
      ),
      binding: QuestionPageBinding(
        tag: tag,
        id: id,
        questionType: questionType,
        questionIndex: questionIndex,
        isWrongQuestion: isWrongQuestion,
        wrongQuestionModel: wrongQuestionModel,
      ),
      routeName: 'question_page_$tag',
    );
  }

  Future<void> toQuestionCompletePage({
    required QuestionType questionType,
    required String questionTrueCount,
    required String questionFalseCount,
    required String questionEmptyCount,
    bool isWrongQuestion = false,
  }) async {
    var tag = UniqueKey().toString();
    await Get.off(
      () => QuestionCompletePage(
        controllerTag: tag,
      ),
      binding: QuestionCompletePageBinding(
        tag: tag,
        questionType: questionType,
        questionTrueCount: questionTrueCount,
        questionFalseCount: questionFalseCount,
        questionEmptyCount: questionEmptyCount,
        isWrongQuestion: isWrongQuestion,
      ),
      routeName: 'question_complete_page_$tag',
      preventDuplicates: false,
    );
  }
}
