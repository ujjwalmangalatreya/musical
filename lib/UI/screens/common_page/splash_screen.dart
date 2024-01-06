import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     // Delay navigation to main app by 2 seconds
    Future.delayed(
      const Duration(seconds: 2),
      () {
       Navigator.pushNamed(context, '/login');
      },
    );
    return const Scaffold(
      body:  Center(
        child: Text("This is my Splash Screen...."),
      ),
    );
  }
}
