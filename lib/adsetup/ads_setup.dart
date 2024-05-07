import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class AdsSetup extends ChangeNotifier {
  bool _rewardedAdLoaded = false;

  bool get rewardedAdLoaded => _rewardedAdLoaded;

  isRewardedAdLoaded(bool value) {
    _rewardedAdLoaded = value;
    notifyListeners();
  }

  bool _nativeAdLoaded = false;

  bool get nativeAdLoaded => _nativeAdLoaded;

  isNativeAdLoaded(bool value) {
    _nativeAdLoaded = value;
    notifyListeners();
  }

  Widget nativeBannerAd() {
    return FacebookNativeAd(
      placementId: "IMG_16_9_APP_INSTALL#7214830935275256_7214838741941142",
      adType: NativeAdType.NATIVE_BANNER_AD,
      height: 50,
      width: double.infinity,
      
    );
  }

  showInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#7214830935275256_7214837028607980",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          FacebookInterstitialAd.showInterstitialAd();
        }
      },
    );
  }

  showRewardedAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId:
          "VID_HD_16_9_15S_APP_INSTALL#7214830935275256_7214839891941027",
      listener: (result, value) {
        if (result == RewardedVideoAdResult.LOADED) {
          FacebookRewardedVideoAd.showRewardedVideoAd();
        }
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE) {}
      },
    );
  }
}
