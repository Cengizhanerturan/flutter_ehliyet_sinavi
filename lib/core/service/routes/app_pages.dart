import 'package:flutter_ehliyet_sinavi/core/service/routes/app_routes.dart';
import 'package:flutter_ehliyet_sinavi/view/about_motorcycle/about_motorcycle_page.dart';
import 'package:flutter_ehliyet_sinavi/view/about_motorcycle/about_motorcycle_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/current_information/current_information_page.dart';
import 'package:flutter_ehliyet_sinavi/view/current_information/current_information_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/driving_test/driving_test_page.dart';
import 'package:flutter_ehliyet_sinavi/view/driving_test/driving_test_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/home/home_page.dart';
import 'package:flutter_ehliyet_sinavi/view/home/home_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/in_car_indicators/in_car_indicators_page.dart';
import 'package:flutter_ehliyet_sinavi/view/in_car_indicators/in_car_indicators_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/parking_rules/parking_rules_page.dart';
import 'package:flutter_ehliyet_sinavi/view/parking_rules/parking_rules_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/previously_questions/previously_questions_page.dart';
import 'package:flutter_ehliyet_sinavi/view/previously_questions/previously_questions_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/settings/settings_page.dart';
import 'package:flutter_ehliyet_sinavi/view/settings/settings_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/splash/splash_page.dart';
import 'package:flutter_ehliyet_sinavi/view/splash/splash_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/things_to_know/things_to_know_page.dart';
import 'package:flutter_ehliyet_sinavi/view/things_to_know/things_to_know_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topic_explanations_page.dart';
import 'package:flutter_ehliyet_sinavi/view/topic_explanations/topic_explanations_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/traffic_signs/traffic_signs_page.dart';
import 'package:flutter_ehliyet_sinavi/view/traffic_signs/traffic_signs_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/trial_exam/trial_exam_page.dart';
import 'package:flutter_ehliyet_sinavi/view/trial_exam/trial_exam_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/video_questions/video_questions_page.dart';
import 'package:flutter_ehliyet_sinavi/view/video_questions/video_questions_page_binding.dart';
import 'package:flutter_ehliyet_sinavi/view/wrong_questions/wrong_questions_page.dart';
import 'package:flutter_ehliyet_sinavi/view/wrong_questions/wrong_questions_page_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static String initial = Routes.initial;
  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.topicExplanations,
      page: () => const TopicExplanationsPage(),
      binding: TopicExplanationsPageBinding(),
    ),
    GetPage(
      name: Routes.trialExam,
      page: () => const TrialExamPage(),
      binding: TrialExamPageBinding(),
    ),
    GetPage(
      name: Routes.videoQuestions,
      page: () => const VideoQuestionsPage(),
      binding: VideoQuestionsPageBinding(),
    ),
    GetPage(
      name: Routes.previouslyQuestions,
      page: () => const PreviouslyQuestionsPage(),
      binding: PreviouslyQuestionsPageBinding(),
    ),
    GetPage(
      name: Routes.trafficSigns,
      page: () => const TrafficSignsPage(),
      binding: TrafficSignsPageBinding(),
    ),
    GetPage(
      name: Routes.inCarIndicators,
      page: () => const InCarIndicatorsPage(),
      binding: InCarIndicatorsPageBinding(),
    ),
    GetPage(
      name: Routes.drivingTest,
      page: () => const DrivingTestPage(),
      binding: DrivingTestPageBinding(),
    ),
    GetPage(
      name: Routes.parkingRules,
      page: () => const ParkingRulesPage(),
      binding: ParkingRulesPageBinding(),
    ),
    GetPage(
      name: Routes.aboutMotorcycle,
      page: () => const AboutMotorcyclePage(),
      binding: AboutMotorcyclePageBinding(),
    ),
    GetPage(
      name: Routes.thingsToKnow,
      page: () => const ThingsToKnowPage(),
      binding: ThingsToKnowPageBinding(),
    ),
    GetPage(
      name: Routes.currentInformation,
      page: () => const CurrentInformationPage(),
      binding: CurrentInformationPageBinding(),
    ),
    GetPage(
      name: Routes.wrongQuestions,
      page: () => const WrongQuestionsPage(),
      binding: WrongQuestionsPageBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsPage(),
      binding: SettingsPageBinding(),
    ),
  ];
}
