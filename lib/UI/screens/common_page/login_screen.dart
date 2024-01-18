import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/UI/screens/common_page/tab_bar.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../common_widgets/my_button.dart';
import '../common_widgets/my_textfield.dart';
import '../common_widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is AuthInProgress){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state is AuthSuccessful){
          return TabBarMenu(userData: state.userData,);
        }else if(state is AuthFailed){
          return  Center(
              child: AlertDialog(
                title: const Text("Authentication Failed.."),
                content: Text((state).failedErrorMessage),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: const Text('Close'),
                  ),
                ],
              )
            //Text((state as AuthFailed).failedErrorMessage),
          );
        }else {
          print(state);
          return Scaffold(
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
                        Icons.lock,
                        size: 100,
                      ),
                      const SizedBox(height: 50),
                      // welcome back, you've been missed!
                      Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // username textfield
                      MyTextField(
                        controller: usernameController,
                        hintText: 'Email',
                        obscureText: false,
                        formKey: usernameFormKey,
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
                      // forgot password?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      // sign in button
                      MyButton(
                        onTap: () {
                          if (usernameFormKey.currentState!.validate() &&
                              passwordFormKey.currentState!.validate()) {
                            // ToDo : Need to validate valid email
                            // TODO : When the fields are validated need to signin from firebase
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Welcome Back !!!!')),
                            );
                            context.read<AuthBloc>().add(SignInEvent(
                                usernameController.text, passwordController.text));
                          }

                        },
                        buttonName: "Sign In",
                      ),
                      const SizedBox(height: 50),
                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      // google + apple sign in buttons
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          SquareTile(imagePath: 'assets/google.png'),

                          SizedBox(width: 25),

                          // apple button
                          SquareTile(imagePath: 'assets/facebook.png')
                        ],
                      ),

                      const SizedBox(height: 50),

                      // Already a member ? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
