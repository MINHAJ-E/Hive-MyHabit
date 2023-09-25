import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gym 1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.transparent, // This makes the scaffold background transparent
            child: Column(
              children: [
                // Image.asset(
                  // "assets/gym_1.jpg",
                  // fit: BoxFit.fitHeight,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}