import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/util/extensions.dart';

class QuestionModel {
  final String id;
  final String question;
  final String answer;
  final String a;
  final String b;
  final String c;
  final String d;
  final QuestionType questionType;
  final String questionTypeIcon;
  final String? lessonID;
  final String? lessonName;
  final String? questionImage;
  final String? questionVideo;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.questionType,
    required this.questionTypeIcon,
    this.lessonID,
    this.lessonName,
    this.questionImage,
    this.questionVideo,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        questionType: json["question_type"].toString().getQuestionType,
        questionTypeIcon: json["question_type"].toString().getQuestionTypeIcon,
        lessonID: json["lesson_id"],
        lessonName: json["lesson_name"],
        questionImage: json["question_image"],
        questionVideo: json["question_video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "question_type": questionType.getString,
        "questionTypeIcon": questionTypeIcon,
        "lesson_id": lessonID,
        "lesson_name": lessonName,
        "question_image": questionImage,
        "question_video": questionVideo,
      };

  static List<QuestionModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => QuestionModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  static List<Map<String, dynamic>> encoder(List<QuestionModel> list) {
    try {
      return list.map((element) => element.toJson()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
