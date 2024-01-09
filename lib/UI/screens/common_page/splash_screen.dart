import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musical_mingle/UI/screens/common_page/login_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/tab_bar.dart';
import 'package:musical_mingle/UI/screens/musician_screens/dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const TabBarMenu();
                } else {
                  return const LoginPage();
                }
              },
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Splash Screen"), // TODO : Need to create a splash screen
            ),
          );
        }
      },
    );
  }
}
