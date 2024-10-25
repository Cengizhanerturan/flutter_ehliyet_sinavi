import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/view/question/question_complete.dart/question_complete_page_controller.dart';
import 'package:get/get.dart';

class QuestionCompletePageBinding extends Bindings {
  final String tag;
  final QuestionType questionType;
  final String questionTrueCount;
  final String questionFalseCount;
  final String questionEmptyCount;
  final bool isWrongQuestion;

  QuestionCompletePageBinding({
    required this.tag,
    required this.questionType,
    required this.questionTrueCount,
    required this.questionFalseCount,
    required this.questionEmptyCount,
    this.isWrongQuestion = false,
  });

  @override
  void dependencies() {
    Get.put(
      QuestionCompletePageController(
        questionType: questionType,
        questionTrueCount: questionTrueCount,
        questionFalseCount: questionFalseCount,
        questionEmptyCount: questionEmptyCount,
        isWrongQuestion: isWrongQuestion,
      ),
      tag: tag,
    );
  }
}
