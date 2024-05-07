import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_walls/adsetup/ads_setup.dart';
import 'package:new_walls/homescreen/hometabs/categories.dart';
import 'package:new_walls/homescreen/hometabs/premium.dart';
import 'package:new_walls/homescreen/hometabs/random.dart';
import 'package:new_walls/theme/theme_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      AdsSetup().showInterstitialAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          SystemNavigator.pop();
        },
        child: Scaffold(
          backgroundColor: AppTheme.whiteColor,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Premium',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Random',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Hero(
              tag: 'appbarHero',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppTheme.primaryColor),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Walls',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppTheme.hintColor),
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              CategoriesTab(),
              PremiumTab(),
              RandomTab(),
            ],
          ),
          bottomNavigationBar: AdsSetup().nativeBannerAd(),
        ),
      ),
    );
  }
}
