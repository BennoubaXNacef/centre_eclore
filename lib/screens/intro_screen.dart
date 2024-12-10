import 'package:centre_eclore/screens/page_route_builder.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart'; // Import the LoginScreen

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _jumpController;
  late Animation<double> _jumpAnimation;
  double _logoOpacity = 1.0; // Control the opacity of the logo
  double _firstTextOpacity = 0.0; // Control the opacity of the first text
  double _secondTextOpacity = 0.0; // Control the opacity of the second text
  int _currentIndex = -1; // -1 for initial logo, 0 onwards for text+images
  double _contentOpacity = 1.0; // For fading content in and out
  bool _showButtons = false; // Control the visibility of Next and Skip buttons

  // List of texts
  final List<String> _texts = [
    'Centre Eclore vous propose des services de bien-être et de développement personnel.',
    'Réservez vos séances de relaxation et découvrez nos experts en thérapie holistique.',
    'Une interface simple pour harmoniser votre corps et esprit en quelques clics.'
  ];

  // List of image paths
  final List<String?> _images = [
    'assets/images/heart.png',
    'assets/images/booking.png',
    'assets/images/clics.png',
  ];

  @override
  void initState() {
    super.initState();

    // Jumping animation controller for the pictures only
    _jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Slower jumping effect
    );
    _jumpAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _jumpController, curve: Curves.easeInOut));

    // Start the jumping effect for pictures
    _jumpController.repeat(reverse: true);

    // Start the logo fade out after 2 seconds
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _logoOpacity = 0.0; // Start fading out the logo
      });
    });

    // First text "Bienvenue au Centre Eclore" fades in
    Timer(const Duration(seconds: 4), () {
      setState(() {
        _firstTextOpacity = 1.0;
      });
    });

    // Fade out first text, and fade in second text
    Timer(const Duration(seconds: 6), () {
      setState(() {
        _firstTextOpacity = 0.0; // Fade out first text
        _secondTextOpacity = 1.0; // Fade in second text
      });
    });

    // Transition to slides (images and texts) after second text fades out
    Timer(const Duration(seconds: 8), () {
      setState(() {
        _secondTextOpacity = 0.0; // Fade out second text
        _currentIndex = 0; // Start showing slides
        _showButtons = true; // Show Next and Skip buttons
      });
    });
  }

  void _nextSlide() {
    if (_currentIndex < _texts.length - 1) {
      // Fade out current slide
      setState(() {
        _contentOpacity = 0.0;
      });

      // Show next slide after fade-out
      Timer(const Duration(milliseconds: 1200), () {
        // Slower transition
        setState(() {
          _currentIndex += 1;
          _contentOpacity = 1.0;
        });
      });
    } else {
      // Use createFadeRoute for custom transition
      Navigator.of(context).push(createFadeRoute(const LoginScreen()));
    }
  }

  void _skipSlides() {
    // Skip all slides and use createFadeRoute for custom transition
    Navigator.of(context).push(createFadeRoute(const LoginScreen()));
  }

  @override
  void dispose() {
    _jumpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF042142), // Background color #042142
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with beating animation and fading effect (Only shows initially)
                if (_currentIndex == -1)
                  AnimatedOpacity(
                    opacity: _logoOpacity, // Opacity of the logo
                    duration:
                        const Duration(seconds: 2), // Smooth fade-out duration
                    child: Image.asset(
                      'assets/images/logo.png', // Replace with your logo path
                      width: 150,
                      height: 150,
                    ),
                  ),

                const SizedBox(height: 40), // Space between logo and text

                // First Text "Bienvenue au Centre Eclore"
                if (_currentIndex == -1)
                  AnimatedOpacity(
                    opacity: _firstTextOpacity,
                    duration: const Duration(seconds: 2),
                    child: const Text(
                      'Bienvenue au Centre Eclore',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text
                      ),
                    ),
                  ),

                // Second Text "Éveillez votre bien-être..."
                if (_currentIndex == -1)
                  AnimatedOpacity(
                    opacity: _secondTextOpacity,
                    duration: const Duration(seconds: 2),
                    child: const Text(
                      'Éveillez votre bien-être, harmonisez votre esprit.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text
                      ),
                    ),
                  ),

                // Content (images and texts) once the logo and first two texts have faded out
                if (_currentIndex >= 0)
                  AnimatedOpacity(
                    opacity: _contentOpacity,
                    duration: const Duration(
                        milliseconds: 1200), // Slower fade effect
                    child: Column(
                      children: [
                        if (_images[_currentIndex] != null)
                          ScaleTransition(
                            scale: _jumpAnimation, // Jumping effect on images
                            child: Image.asset(
                              _images[_currentIndex]!,
                              width: 200,
                              height: 200,
                            ),
                          ),
                        const SizedBox(height: 20),
                        Text(
                          _texts[_currentIndex],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Position the Next and Skip buttons at the bottom of the screen
          if (_showButtons)
            Align(
              alignment:
                  Alignment.bottomCenter, // Position the buttons at the bottom
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _skipSlides,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      child: const Text('Skip'),
                    ),
                    ElevatedButton(
                      onPressed: _nextSlide,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
