import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'package:invmovieconcept1/configs/Ads.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../Dimensions.dart';

class HomeBannerAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!App.showAds) {
      return Container();
    }

    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.bgHeight + Dimensions.ratingRadius / 2,
      child: Container(
        width: double.infinity,
        height: Dimensions.bannerAdHeight,
        child: AdmobBanner(
          adSize: AdmobBannerSize.BANNER,
          adUnitId: Ads.getHomeBannderId(),
        ),
      ),
    );
  }
}
