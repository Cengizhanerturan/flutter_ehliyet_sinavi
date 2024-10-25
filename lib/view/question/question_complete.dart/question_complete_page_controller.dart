import 'package:confetti/confetti.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/string_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/util/extensions.dart';
import 'package:flutter_ehliyet_sinavi/core/util/helper.dart';
import 'package:get/get.dart';

class QuestionCompletePageController extends GetxController with StateMixin {
  final QuestionType questionType;
  final String questionTrueCount;
  final String questionFalseCount;
  final String questionEmptyCount;
  final bool isWrongQuestion;

  QuestionCompletePageController({
    required this.questionType,
    required this.questionTrueCount,
    required this.questionFalseCount,
    required this.questionEmptyCount,
    this.isWrongQuestion = false,
  });

  final confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  @override
  void onInit() {
    super.onInit();
    playConfetti();
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }

  void playConfetti() {
    if (getQuestionCompleteStatus() == QuestionCompleteStatus.SUCCESS) {
      confettiController.play();
    }
  }

  QuestionCompleteStatus getQuestionCompleteStatus() {
    if (isWrongQuestion) {
      if (int.parse(questionTrueCount) == 1) {
        return QuestionCompleteStatus.SUCCESS;
      } else {
        return QuestionCompleteStatus.BAD;
      }
    } else {
      if (questionType == QuestionType.VIDEO_QUESTION) {
        if (int.parse(questionTrueCount) == 1) {
          return QuestionCompleteStatus.SUCCESS;
        } else {
          return QuestionCompleteStatus.BAD;
        }
      } else if (questionType == QuestionType.TRIAL_EXAM) {
        if (int.parse(questionTrueCount) >= 12) {
          return QuestionCompleteStatus.SUCCESS;
        } else if (int.parse(questionTrueCount) >= 8) {
          return QuestionCompleteStatus.NORMAL;
        } else {
          return QuestionCompleteStatus.BAD;
        }
      } else {
        if (int.parse(questionTrueCount) >= 12) {
          return QuestionCompleteStatus.SUCCESS;
        } else if (int.parse(questionTrueCount) >= 8) {
          return QuestionCompleteStatus.NORMAL;
        } else {
          return QuestionCompleteStatus.BAD;
        }
      }
    }
  }

  String getInfoTypeText() {
    if (isWrongQuestion) {
      if (int.parse(questionTrueCount) == 1) {
        return StringConstants.questionCompleteWrongQuestionSuccessContentText;
      } else {
        return StringConstants.questionCompleteWrongQuestionBadContentText;
      }
    } else {
      return '"${Helper.toCamelcase(text: questionType.getTurkishString)}" kategorisinde\n"$questionTrueCount" doğru cevap verdin.';
    }
  }

  String getInfoText() {
    if (isWrongQuestion) {
      if (int.parse(questionTrueCount) == 1) {
        return StringConstants.questionCompleteWrongQuestionSuccessText;
      } else {
        return StringConstants.questionCompleteWrongQuestionBadText;
      }
    } else {
      if (questionType == QuestionType.VIDEO_QUESTION) {
        if (int.parse(questionTrueCount) == 1) {
          return StringConstants.questionCompleteSuccessText;
        } else {
          return StringConstants.questionCompleteBadText;
        }
      } else if (questionType == QuestionType.TRIAL_EXAM) {
        if (int.parse(questionTrueCount) >= 12) {
          return StringConstants.questionCompleteSuccessText;
        } else if (int.parse(questionTrueCount) >= 8) {
          return StringConstants.questionCompleteNormalText;
        } else {
          return StringConstants.questionCompleteBadText;
        }
      } else {
        if (int.parse(questionTrueCount) >= 12) {
          return StringConstants.questionCompleteSuccessText;
        } else if (int.parse(questionTrueCount) >= 8) {
          return StringConstants.questionCompleteNormalText;
        } else {
          return StringConstants.questionCompleteBadText;
        }
      }
    }
  }

  String getQuestionImg() {
    if (isWrongQuestion) {
      return AssetsConstants.checklistIcon;
    } else {
      if (questionType == QuestionType.VIDEO_QUESTION) {
        return AssetsConstants.playIcon;
      } else if (questionType == QuestionType.TRIAL_EXAM) {
        return AssetsConstants.timerIcon;
      } else {
        return AssetsConstants.questionMarkIcon;
      }
    }
  }

  String getQuestionCategory() {
    if (isWrongQuestion) {
      return StringConstants.wrongQuestions;
    } else {
      if (questionType == QuestionType.VIDEO_QUESTION) {
        return StringConstants.videoQuestions;
      } else if (questionType == QuestionType.TRIAL_EXAM) {
        return StringConstants.trialExam;
      } else {
        return StringConstants.previouslyQuestions;
      }
    }
  }

  void replay() {
    Get.back();
  }
}
