import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
