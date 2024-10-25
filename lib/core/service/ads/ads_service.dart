import 'package:flutter_ehliyet_sinavi/core/service/cache/cache_service.dart';
import 'package:flutter_ehliyet_sinavi/core/util/debug.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class AdsService extends GetxService {
  final _cacheService = Get.find<CacheService>();
  var showAds = true;

  @override
  void onInit() {
    super.onInit();
    showAds = Debug.showAds;
    Appodeal.initialize(
        appKey: "YOUR_APP_KEY",
        adTypes: [
          AppodealAdType.Interstitial,
          AppodealAdType.RewardedVideo,
          AppodealAdType.Banner,
          AppodealAdType.MREC
        ],
        onInitializationFinished: (errors) => {});

    Appodeal.setTesting(Debug.debug);
  }

  Future<void> showInterstitialAds() async {
    if (showAds) {
      var isShowInterstitialAds = await _cacheService.isShowInterstitialAds();
      if (isShowInterstitialAds) {
        await Appodeal.show(AppodealAdType.Interstitial);
      }
    }
  }

  Future<void> showMRECAds() async {
    if (showAds) {
      await Appodeal.show(AppodealAdType.MREC);
    }
  }

  Future<void> showRewardedVideoAds() async {
    if (showAds) {
      await Appodeal.show(AppodealAdType.RewardedVideo);
    }
  }

  Widget buildBannerAds() {
    if (showAds) {
      return const AppodealBanner(
          adSize: AppodealBannerSize.BANNER, placement: "default");
    } else {
      return const SizedBox();
    }
  }
}
