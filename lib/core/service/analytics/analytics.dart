import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class AnalyticsService extends GetxService {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  late FirebaseAnalyticsObserver analyticsObserver;
  late FirebaseAnalyticsObserver landingAnalyticsObserver;

  @override
  void onInit() {
    super.onInit();
    analyticsObserver = FirebaseAnalyticsObserver(
      analytics: analytics,
      nameExtractor: (settings) {
        return settings.name;
      },
    );
    landingAnalyticsObserver = FirebaseAnalyticsObserver(
      analytics: analytics,
    );
  }

  Future<void> setUserProperties({required String? userId}) async {
    await analytics.setUserId(id: userId);
  }
}
