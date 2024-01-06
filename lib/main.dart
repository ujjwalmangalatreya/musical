import 'package:flutter/material.dart';

import 'package:musical_mingle/UI/screens/common_page/login_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/register_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/splash_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/tab_bar.dart';


import 'UI/screens/musician_screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musical Mingle',
      routes:  {
        '/login': (context) => const LoginPage(),
        '/register' :(context) => const RegisterPage(),
        '/dashboard' :(context) => const TabBarMenu(),
      },
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
