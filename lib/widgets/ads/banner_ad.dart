import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:invmovieconcept1/configs/Ads.dart';
import 'package:invmovieconcept1/configs/App.dart';

enum AppBannerAdKey {
  home,
  movieDetail,
}

final mapAdKeyMap = {
  AppBannerAdKey.home: Ads.bannerHome(),
  AppBannerAdKey.movieDetail: Ads.bannerMovieDetail(),
};

class AppBannerAd extends StatefulWidget {
  AppBannerAd({
    Key? key,
    this.adKey = AppBannerAdKey.home,
  }) : super(key: key);

  final AppBannerAdKey adKey;

  @override
  State<AppBannerAd> createState() => _AppBannerAdState();
}

class _AppBannerAdState extends State<AppBannerAd> {
  bool isAdLoaded = false;
  BannerAd? ad;

  @override
  void initState() {
    super.initState();

    if (!App.showAds) return;

    final adUnitId = mapAdKeyMap[widget.adKey]!;

    this.ad = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.largeBanner,
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

    this.ad?.load();
  }

  @override
  Widget build(BuildContext context) {
    if (!App.showAds || !this.isAdLoaded) {
      return SizedBox();
    }

    return SizedBox(
      height: this.ad!.size.height.toDouble(),
      width: this.ad?.size.width.toDouble(),
      child: this.isAdLoaded ? AdWidget(ad: this.ad!) : SizedBox(),
    );
  }
}
