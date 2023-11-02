// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:my_habit_app/bottombar/bottom_bar.dart';
// import 'package:my_habit_app/pages/introPage/intro_page_1.dart';
// import 'package:my_habit_app/pages/introPage/intro_page_2.dart';
// import 'package:my_habit_app/pages/introPage/intro_page_3.dart';
// import 'package:my_habit_app/screens/logIn_Screens/logIn_screen.dart';
// // import 'package:my_habit_app/screens/pages/introPage/intro_page_1.dart';
// // import 'package:my_habit_app/screens/pages/introPage/intro_page_2.dart';
// // import 'package:my_habit_app/screens/pages/introPage/intro_page_3.dart';
// // import 'package:my_habit_app/bottombar/bottom_bar.dart';
// // import 'package:my_habit_app/introPage/intro_page_1.dart';
// // import 'package:my_habit_app/introPage/intro_page_2.dart';
// // import 'package:my_habit_app/introPage/intro_page_3.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnBodyScreen extends StatefulWidget {
//   const OnBodyScreen({super.key});

//   @override
//   State<OnBodyScreen> createState() => _OnBodyScreenState();
// }

// class _OnBodyScreenState extends State<OnBodyScreen> {
//   final PageController _controller = PageController();
//   bool onLastPage = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         PageView(
//           controller: _controller,
//           onPageChanged: (index) {
//             setState(() {
//               onLastPage = (index == 2);
//             });
//           },
//           children:  const [
//             IntroPage1(),
//             IntroPage2(),
//             IntroPage3(),
//           ],
//         ),
//         Container(
//             alignment: Alignment(0, 0.85),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       _controller.jumpToPage(2);
//                     },
//                     child: const Text(
//                       "Skip",
//                       style: TextStyle(
//                           color: Colors.amber,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     )),
//                 SmoothPageIndicator(
//                   controller: _controller,
//                   count: 3,
//                   effect: const ExpandingDotsEffect(
//                     // Change this to the effect you want to use
//                     dotColor:
//                         Colors.grey, // Set the color of the inactive indicators
//                     activeDotColor:
//                         Colors.amber, // Set the color of the active indicator
//                     dotHeight: 12,
//                     dotWidth: 12,
//                     spacing: 15,
//                   ),
//                 ),
//                 onLastPage
//                     ? GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (ctx) =>  ScreenLogin()));
//                         },
//                         child: const Text(
//                           "Done",
//                           style: TextStyle(
//                               color: Colors.amber,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ))
//                     : GestureDetector(
//                         onTap: () {
//                           _controller.nextPage(
//                               duration: Duration(milliseconds: 500),
//                               curve: Curves.easeIn);
//                         },
//                         child: const Text(
//                           "Next",
//                           style: TextStyle(
//                               color: Colors.amber,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20),
//                         ))
//               ],
//             ))
//       ],
//     ));
//   }
// }
