import 'package:flutter/material.dart';

import '../common_widgets/my_button.dart';
import '../common_widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // logo
                const Icon(
                  Icons.app_registration_rounded,
                  size: 100,
                ),
                const SizedBox(height: 50),
                // Regis
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Join, Jam, and Hit the Stage – Register Today!",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // username textfield
                const MyTextField(
                  controller: null,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // password textfield
                const MyTextField(
                  controller: null,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // confirm password field
                const MyTextField(
                  controller: null,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                // forgot password?
                const SizedBox(height: 25),
                // sign in button
                MyButton(onTap: () {
                  //  loginPageLogic.signUserIn(usernameController.text,passwordController.text);
                },buttonName: "Sign Up",),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
