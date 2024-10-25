import 'package:flutter_ehliyet_sinavi/core/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CacheService extends GetxService {
  var box = GetStorage();

  Future<bool> isShowInterstitialAds() async {
    try {
      if (box.hasData('interstitialAdsCount')) {
        var interstitialCount = box.read('interstitialAdsCount');
        if (interstitialCount % AppConstants.interstitialAdsCount == 0) {
          await setInterstitialAdsCount(count: interstitialCount + 1);
          return true;
        } else {
          await setInterstitialAdsCount(count: interstitialCount + 1);
          return false;
        }
      } else {
        await setInterstitialAdsCount(count: 0);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> setInterstitialAdsCount({required int count}) async {
    try {
      await box.write('interstitialAdsCount', count);
    } catch (e) {
      rethrow;
    }
  }
}
