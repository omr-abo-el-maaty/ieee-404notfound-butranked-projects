import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ieee/Screens/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _moveUp = false;

  @override
  void initState() {
    super.initState();

    // Start animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _moveUp = true;
      });
    });

    // Navigate after animation finishes
    Timer(const Duration(milliseconds: 1350), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedAlign(
        duration: const Duration(seconds: 1), // animation time
        curve: Curves.easeInOut,
        alignment: _moveUp ? Alignment.topCenter : Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // keep space from very top
          child: Image.asset(
            'assets/images/ViraRank.png',
            
          ),
        ),
      ),
    );
  }
}
