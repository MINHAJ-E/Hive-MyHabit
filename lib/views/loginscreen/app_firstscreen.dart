import 'package:flutter/material.dart';
import 'package:my_habit_app/widgets/bottom_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         // child: Lottie.network("https://lottie.host/42efeb3d-e79b-4a1b-b038-35dcbaf19236/8iPK8QNDBh.json",fit: BoxFit.cover),
        // child: Image.network(
        //   'https://media.tenor.com/FBeNVFjn-EkAAAAC/ben-redblock-loading.gif',
        //   fit: BoxFit.none, // Set BoxFit.cover to make the image cover the entire screen
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        // ),`
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
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) =>  BottomBar()));
  }
}

