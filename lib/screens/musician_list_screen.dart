import 'package:flutter/material.dart';

class MusicianList extends StatefulWidget {
  const MusicianList({Key? key}) : super(key: key);

  @override
  State<MusicianList> createState() => _MusicianListState();
}

class _MusicianListState extends State<MusicianList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: const Center(
          child: Text("Here you will find all the /n musician that have enrolled according to /n genre"),
        ),
      ),
    );
  }
}
