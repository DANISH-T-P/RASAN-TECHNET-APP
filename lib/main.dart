import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'modules/home/views/splash_page.dart';
import 'theme/app_theme.dart';
import 'modules/home/views/home_page.dart';

void main() {
  runApp(const RasanTechnetApp());
}

class RasanTechnetApp extends StatelessWidget {
  const RasanTechnetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Rasan Technet',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system, // Auto switch based on system theme
          initialRoute: '/splash',
          getPages: [
            GetPage(name: '/splash', page: () => const SplashPage()),
            GetPage(name: '/home', page: () => const HomePage()),
          ],
          defaultTransition: Transition.fadeIn,
        );
      },
    );
  }
}
