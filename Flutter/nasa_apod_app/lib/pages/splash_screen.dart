import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod_app/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/nasa.png',
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 1800,
      splashIconSize: 2000,
      centered: true,
    );
  }
}
