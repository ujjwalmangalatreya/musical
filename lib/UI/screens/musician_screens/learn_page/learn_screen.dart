import 'package:flutter/material.dart';

class LearnMusic extends StatefulWidget {
  const LearnMusic({Key? key}) : super(key: key);

  @override
  State<LearnMusic> createState() => _LearnMusicState();
}

class _LearnMusicState extends State<LearnMusic> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is my screen to learn music..."),
      ),
    );
  }
}
