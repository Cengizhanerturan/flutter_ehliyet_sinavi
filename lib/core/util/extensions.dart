import 'package:flutter_ehliyet_sinavi/core/constants/assets_constants.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';

extension QuestionTypeExtension on QuestionType {
  String? get getFirebaseRef {
    switch (this) {
      case QuestionType.TRIAL_EXAM:
        return 'trial_exam';
      case QuestionType.VIDEO_QUESTION:
        return 'video_questions';
      case QuestionType.PREVIOUSLY_QUESTION:
        return 'previously_questions';
      default:
        return null;
    }
  }

  String get getString {
    switch (this) {
      case QuestionType.TRIAL_EXAM:
        return 'trial_exam';
      case QuestionType.VIDEO_QUESTION:
        return 'video_questions';
      case QuestionType.PREVIOUSLY_QUESTION:
        return 'previously_questions';
      default:
        return 'previously_questions';
    }
  }

  String get getTurkishString {
    switch (this) {
      case QuestionType.TRIAL_EXAM:
        return 'Deneme Sınavı';
      case QuestionType.VIDEO_QUESTION:
        return 'Videolu Sorular';
      case QuestionType.PREVIOUSLY_QUESTION:
        return 'Çıkmış Sorular';
      default:
        return 'Çıkmış Sorular';
    }
  }
}

extension StringExtension on String {
  QuestionType get getQuestionType {
    switch (this) {
      case 'trial_exam':
        return QuestionType.TRIAL_EXAM;
      case 'video_questions':
        return QuestionType.VIDEO_QUESTION;
      case 'previously_questions':
        return QuestionType.PREVIOUSLY_QUESTION;
      default:
        return QuestionType.PREVIOUSLY_QUESTION;
    }
  }

  String get getQuestionTypeIcon {
    switch (this) {
      case 'trial_exam':
        return AssetsConstants.timerIcon;
      case 'video_questions':
        return AssetsConstants.playIcon;
      case 'previously_questions':
        return AssetsConstants.questionMarkIcon;
      default:
        return AssetsConstants.questionMarkIcon;
    }
  }
}
