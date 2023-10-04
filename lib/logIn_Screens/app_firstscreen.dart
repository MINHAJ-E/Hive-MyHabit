import 'package:flutter/material.dart';
import 'package:my_habit_app/introPage/onBodyScreens/onbody_screens.dart';

class AppFirstScreen extends StatefulWidget {
  const AppFirstScreen({super.key});

  @override
  State<AppFirstScreen> createState() => _AppFirstScreenState();
}
class _AppFirstScreenState extends State<AppFirstScreen> {
  @override 
  void initState() {
    gotoLogin(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/firstAppimage.jpg',
          fit: BoxFit.cover, // Set BoxFit.cover to make the image cover the entire screen
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  Future<void> gotoLogin(context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => OnBodyScreen()));
  }
}

