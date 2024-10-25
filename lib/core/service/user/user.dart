import 'package:flutter_ehliyet_sinavi/core/constants/enums.dart';
import 'package:flutter_ehliyet_sinavi/core/model/user.dart';
import 'package:flutter_ehliyet_sinavi/core/service/analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserService extends GetxService {
  var user = Rxn<UserModel>(null);

  Future<void> signInAnonymously() async {
    try {
      await auth.FirebaseAuth.instance
          .signInAnonymously()
          .then((auth.UserCredential userCredential) async {
        await Get.find<AnalyticsService>()
            .setUserProperties(userId: user.value!.uid);
      });
    } catch (e) {
      debugPrint('Sign In Error! $e');
    }
  }

  Future<void> getUserData({required String uid}) async {}

  bool isUpdateUnlockedQuestion(
      {required QuestionType questionType, required int questionIndex}) {
    if (questionType == QuestionType.PREVIOUSLY_QUESTION) {
      if (user.value!.unlockedPreviouslyQuestionIndex == questionIndex) {
        return true;
      } else {
        return false;
      }
    } else if (questionType == QuestionType.TRIAL_EXAM) {
      if (user.value!.unlockedTrialExamIndex == questionIndex) {
        return true;
      } else {
        return false;
      }
    } else {
      if (user.value!.unlockedVideoQuestionIndex == questionIndex) {
        return true;
      } else {
        return false;
      }
    }
  }
}
