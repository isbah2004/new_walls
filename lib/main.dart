
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_walls/internetconnectivitysetup/internet_connectivity.dart';
import 'package:new_walls/provider/full_screen_provider.dart';
import 'package:new_walls/splashscreen/splash_screen.dart';
import 'package:new_walls/theme/theme_data.dart';
import 'package:new_walls/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

void main() {
 
  
  runApp(const MyApp());
  Get.put(InternetController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FullScreenProvider()),
        ChangeNotifierProvider(create: (_) => ViewModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
