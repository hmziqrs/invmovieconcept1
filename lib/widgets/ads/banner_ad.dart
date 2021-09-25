import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:invmovieconcept1/screens/Home/Dimensions.dart';
import 'package:invmovieconcept1/configs/Ads.dart';
import 'package:invmovieconcept1/configs/App.dart';

class AppBannerAd extends StatefulWidget {
  const AppBannerAd({Key key}) : super(key: key);

  @override
  State<AppBannerAd> createState() => _AppBannerAdState();
}

class _AppBannerAdState extends State<AppBannerAd> {
  bool isAdLoaded = false;
  BannerAd ad;

  @override
  void initState() {
    super.initState();

    this.ad = BannerAd(
      adUnitId: Ads.getTestBannerId(),
      size: AdSize.mediumRectangle,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    this.ad.load();
  }

  @override
  Widget build(BuildContext context) {
    if (!App.showAds || !this.isAdLoaded) {
      return SizedBox();
    }

    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.bgHeight + Dimensions.ratingRadius * 0.7,
      child: SizedBox(
        height: 72.0,
        width: 300 ?? this.ad.size.width.toDouble(),
        child: this.isAdLoaded ? AdWidget(ad: this.ad) : SizedBox(),
      ),
    );
  }
}
