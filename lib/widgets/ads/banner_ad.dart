import 'package:flutter/material.dart';
// import 'package:admob_flutter/admob_flutter.dart';

import 'package:invmovieconcept1/configs/Ads.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../../screens/Home/Dimensions.dart';

class AppBannerAd extends StatelessWidget {
  const AppBannerAd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!App.showAds) {
      return SizedBox();
    }

    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.bgHeight + Dimensions.ratingRadius / 2,
      child: SizedBox(
        width: double.infinity,
        height: Dimensions.bannerAdHeight,
        child: Text("MEnOW"),
      ),
    );
  }
}
