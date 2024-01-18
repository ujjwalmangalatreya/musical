import 'package:flutter/material.dart';



class AuthFailedWidget extends StatelessWidget {
  const AuthFailedWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Center(
    child: Text("Auth Failed. Please Try again."),
    );
  }
}
