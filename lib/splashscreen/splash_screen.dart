import 'package:flutter/material.dart';
import 'package:new_walls/homescreen/home_screen.dart';
import 'package:new_walls/reusablewidgets.dart/animated_text.dart';
import 'package:new_walls/theme/theme_data.dart';
import 'package:new_walls/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final viewModelProvider = Provider.of<ViewModel>(context, listen: false);

    viewModelProvider.fetchData().then(
      (value) {
        viewModelProvider.createCombinedList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Hero(
            tag: 'appbarHero',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedText(
                  title: 'New',
                  firstColor: AppTheme.primaryColor,
                  secondColor: AppTheme.hintColor,
                ),
                SizedBox(
                  width: 10,
                ),
                AnimatedText(
                  title: 'Walls',
                  firstColor: AppTheme.hintColor,
                  secondColor: AppTheme.primaryColor,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: AppTheme.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Consumer<ViewModel>(
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  backgroundColor: AppTheme.textBackground,
                  value: value.progressStatus / 100,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
