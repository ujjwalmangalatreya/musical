import 'package:flutter/material.dart';




class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/article_not_found.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          const Positioned(
            bottom: 260,
            left: 100,
            child: Text(
              'Article Not Found',

            ),
          ),
          const Positioned(
            bottom: 190,
            left: 50,
            child: Text(
              'Oops! The article you are looking for\nis not found.',

              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 120,
            left: 130,
            right: 130,
            child: ElevatedButton(
              onPressed: () {
                // Your button logic goes here
              },
              style: ElevatedButton.styleFrom(

              ),
              child: const Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}