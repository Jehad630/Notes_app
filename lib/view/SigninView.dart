import 'package:flutter/material.dart';

class Signinview extends StatelessWidget {
  const Signinview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50),
          Image.asset("assets/notes.png", height: 150, width: 200),
          SizedBox(height: 20),
          Text(
            "Notes App   ",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            " Sign in",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
