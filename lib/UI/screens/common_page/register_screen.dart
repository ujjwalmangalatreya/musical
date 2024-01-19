import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/UI/screens/common_widgets/loader_widget.dart';
import 'package:musical_mingle/blocs/registration/registration_bloc.dart';

import '../common_widgets/my_button.dart';
import '../common_widgets/my_textfield.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final confirmPasswordFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationLoading) {
            return const Loader();
          } else if (state is RegistrationSuccess) {
            return const LoginPage();
          } else if (state is RegistrationError) {
            return const Center(
              child: Text("Some thing went wrong.."),
            );
          } else {
            return SafeArea(
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
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        formKey: emailFormKey,
                      ),
                      const SizedBox(height: 10),
                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        formKey: passwordFormKey,
                      ),
                      const SizedBox(height: 10),
                      // confirm password field
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                        formKey: confirmPasswordFormKey,
                      ),
                      // forgot password?
                      const SizedBox(height: 25),
                      // sign Up button
                      MyButton(
                        onTap: () {
                          if (emailFormKey.currentState!.validate() &&
                              passwordFormKey.currentState!.validate() &&
                              confirmPasswordFormKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Password do not match...'),
                                ),
                              );
                            } else {
                              context.read<RegistrationBloc>().add(RegisterUser(
                                emailController.text,
                                passwordController.text,
                              ));
                            }
                          }
                        },
                        buttonName: "Sign Up",
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already a member?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              'Login here',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// Widget registrationPage(
//     emailController,
//     passwordController,
//     confirmPasswordController,
//     emailFormKey,
//     passwordFormKey,
//     confirmPasswordFormKey,
//     context) {
//   return

