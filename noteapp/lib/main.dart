import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteApp',
      debugShowCheckedModeBanner: false,
      // theme: isDark ? AppTheme.dark : AppTheme.light,
      home: AnimatedSplashScreen(
        splash: Lottie.asset('assets/note.json'),
        nextScreen: HomePage(onToggleTheme: toggleTheme,),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        splashIconSize: 150,
      ),
    );
  }
}
