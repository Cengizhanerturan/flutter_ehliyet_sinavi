import 'package:flutter_ehliyet_sinavi/core/model/question.dart';

class UserModel {
  final String uid;
  final int totalExam;
  final int totalQuestion;
  final int trueCount;
  final int falseCount;
  final List<QuestionModel> wrongQuestionsList;
  final int unlockedTrialExamIndex;
  final int unlockedVideoQuestionIndex;
  final int unlockedPreviouslyQuestionIndex;

  UserModel({
    required this.uid,
    required this.totalExam,
    required this.totalQuestion,
    required this.trueCount,
    required this.falseCount,
    required this.wrongQuestionsList,
    required this.unlockedTrialExamIndex,
    required this.unlockedVideoQuestionIndex,
    required this.unlockedPreviouslyQuestionIndex,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        totalExam: json["total_exam"],
        totalQuestion: json["total_question"],
        trueCount: json["true_count"],
        falseCount: json["false_count"],
        wrongQuestionsList: json["wrong_questions_list"] is List<QuestionModel>
            ? json["wrong_questions_list"]
            : QuestionModel.decoder(json["wrong_questions_list"]),
        unlockedTrialExamIndex: json["unlocked_trial_exam_index"],
        unlockedVideoQuestionIndex: json["unlocked_video_question_index"],
        unlockedPreviouslyQuestionIndex:
            json["unlocked_previously_question_index"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "total_exam": totalExam,
        "total_question": totalQuestion,
        "true_count": trueCount,
        "false_count": falseCount,
        "wrong_questions_list": wrongQuestionsList,
        "unlocked_trial_exam_index": unlockedTrialExamIndex,
        "unlocked_video_question_index": unlockedVideoQuestionIndex,
        "unlocked_previously_question_index": unlockedPreviouslyQuestionIndex,
      };

  factory UserModel.createDefault(String uid) => UserModel(
      uid: uid,
      totalExam: 0,
      totalQuestion: 0,
      trueCount: 0,
      falseCount: 0,
      wrongQuestionsList: [],
      unlockedTrialExamIndex: 0,
      unlockedVideoQuestionIndex: 0,
      unlockedPreviouslyQuestionIndex: 0);
}
