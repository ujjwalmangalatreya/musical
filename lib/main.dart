import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/UI/screens/common_page/login_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/profile_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/register_screen.dart';
import 'package:musical_mingle/UI/screens/common_page/splash_screen.dart';

import 'package:musical_mingle/UI/screens/common_page/tab_bar.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/registration/registration_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Musical Mingle',
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => RegisterPage(),
          '/dashboard': (context) =>   const TabBarMenu( userData: null,),
          '/profile': (context) => const ProfileScreen(),
        },
        initialRoute: '/',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        //TOdo: Need to return splash scrren after profile page is completed.
        home: const SplashScreen(),
      ),
    );
  }
}
