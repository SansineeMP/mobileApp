import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:watchmovie_app/Hothit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 27, 27),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          // get more animations json files from lottie files website https://lottiefiles.com/
          child: Lottie.asset(
            "assets/data/logo.json",
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().then((value) => Get.to(() => Hothit(),
                    transition: Transition.fadeIn,
                    duration: Duration(seconds: 1)));
            },
          ),
        ),
      ),
    );
  }
}
