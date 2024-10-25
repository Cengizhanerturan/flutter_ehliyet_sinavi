import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/model/question.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_page_controller.dart';
import 'package:get/get.dart';

class QuestionPageBinding extends Bindings {
  final String tag;
  final QuestionType questionType;
  final String id;
  final int questionIndex;
  final bool isWrongQuestion;
  final QuestionModel? wrongQuestionModel;
  QuestionPageBinding({
    required this.tag,
    required this.questionType,
    required this.id,
    required this.questionIndex,
    this.isWrongQuestion = false,
    this.wrongQuestionModel,
  });

  @override
  void dependencies() {
    Get.put(
        QuestionPageController(
            questionType: questionType,
            id: id,
            questionIndex: questionIndex,
            isWrongQuestion: isWrongQuestion,
            wrongQuestionModel: wrongQuestionModel),
        tag: tag);
  }
}
