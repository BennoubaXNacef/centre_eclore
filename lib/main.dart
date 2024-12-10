import 'package:flutter/material.dart';
import 'screens/intro_screen.dart'; // Intro Screen with the logo
import 'screens/login_screen.dart'; // Login screen
import 'screens/Sign-In.dart'; // Sign-In screen
import 'screens/main_screen.dart'; // Main Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centre Eclore',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Start with the Intro Screen
      routes: {
        '/': (context) => const IntroScreen(), // Beating logo screen
        '/login': (context) => const LoginScreen(), // Login screen
        '/sign_in': (context) => const SignInScreen(), // Sign-In screen route
        '/main': (context) => const MainScreen(), // Main screen after login
      },
    );
  }
}
