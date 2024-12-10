import 'package:flutter/material.dart';
import 'dart:async';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Animation for the beating logo
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true); // Repeat the animation back and forth
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);

    // Transition to App Introduction screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/app-intro');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal, // Background color
      body: Center(
        child: ScaleTransition(
          scale: _animation, // Beating logo animation
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo path
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
