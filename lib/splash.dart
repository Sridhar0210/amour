
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'Page1.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      duration: 4000,
      splashIconSize: double.maxFinite,
      splash: Container(
        height:MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/img/bf1.gif"),
              fit: BoxFit.fill),
        ),
      ),
      nextScreen: const Page1(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
