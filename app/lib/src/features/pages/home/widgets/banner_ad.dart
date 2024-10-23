import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdMob extends StatefulWidget {
  final AdSize adSize;
  final String adUnitId = Platform.isAndroid
      ? "ca-app-pub-3101866454473029/4032911718"
      : "ca-app-pub-3101866454473029/4032911718";
  BannerAdMob({
    super.key,
    this.adSize = AdSize.banner,
  });

  @override
  State<BannerAdMob> createState() => _BannerAdMobState();
}

class _BannerAdMobState extends State<BannerAdMob> {
   BannerAd? _bannerAd;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

   @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  /// Loads a banner ad.
  void _loadAd() {
    final bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }
}
