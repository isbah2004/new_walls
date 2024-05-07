import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_walls/adsetup/ads_setup.dart';
import 'package:new_walls/reusablewidgets.dart/download_button.dart';
import 'package:new_walls/reusablewidgets.dart/pop_button.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl, placeholder;
  const FullScreen(
      {super.key, required this.imageUrl, required this.placeholder});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      AdsSetup().showInterstitialAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: widget.imageUrl,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: widget.imageUrl,
                placeholder: (context, url) => Lottie.asset(widget.placeholder,
                    fit: BoxFit.fill, repeat: true),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PopButton(),
                DownloadButton(
                  imageUrl: widget.imageUrl,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
