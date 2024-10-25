import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdMob extends StatefulWidget {
  // final AdSize adSize;
  final String adUnitId;
  const BannerAdMob({
    super.key,
    required this.adUnitId,
  });

  @override
  State<BannerAdMob> createState() => _BannerAdMobState();
}

class _BannerAdMobState extends State<BannerAdMob> {
  BannerAd? _bannerAd;
  @override
  Widget build(BuildContext context) {
    return _bannerAd == null ? const SizedBox() :SizedBox(
      width: AdSize.banner.width.toDouble(),
      height: AdSize.banner.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }

  @override
  void initState() {
    _loadAd();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  /// Loads a banner ad.
  void _loadAd() {
    final bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: widget.adUnitId,
      request: const AdRequest(

      ),
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
