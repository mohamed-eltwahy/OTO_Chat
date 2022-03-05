import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tel_chat/layout/signin.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  Animation<Offset>? _translateAnimation;
  late ConfettiController _controllerBottomCenter;

  Future<void> navigatToNextScreen() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const SignIn(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controllerBottomCenter.play();
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOutCubic,
      ),
    );
    _translateAnimation = Tween<Offset>(
      begin: const Offset(0, 55),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeOutCubic,
    ));
    _animationController!.forward();

    Future.delayed(Duration.zero, () async {});

    Timer(const Duration(seconds: 3), () async {
      navigatToNextScreen();
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController!,
                  builder: (cxt, child) => FadeTransition(
                    opacity: _fadeAnimation!,
                    child: Transform.translate(
                      offset: _translateAnimation!.value,
                      child: child,
                    ),
                  ),
                  child: SizedBox(
                    width: 150,
                    height: 70, //
                    child: ConfettiWidget(
                      blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
                      confettiController: _controllerBottomCenter,
                      child: const Text(
                        'Chat Clone',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
