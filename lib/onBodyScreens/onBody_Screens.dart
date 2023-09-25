import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottomBar.dart';
import 'package:my_habit_app/introPage/introPage_1.dart';
import 'package:my_habit_app/introPage/introPage_2.dart';
import 'package:my_habit_app/introPage/introPage_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBodyScreen extends StatefulWidget {
  const OnBodyScreen({super.key});

  @override
  State<OnBodyScreen> createState() => _OnBodyScreenState();
}

class _OnBodyScreenState extends State<OnBodyScreen> {
  PageController _controller=PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
           PageView(
           
            controller: _controller,
             onPageChanged: (index) {
               setState(() {
                 onLastPage=(index==2);
               });
             },
        children: [
          IntroPage1(),
          IntroPage2(),
          IntroPage3(),
        ],
      ),
      Container(
        alignment: Alignment(0, 0.85),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _controller.jumpToPage(2);
              },
              child: Text("Skip",style: TextStyle(color: Colors.amber),)),
            SmoothPageIndicator(controller: _controller, count: 3),
           
           onLastPage?
            GestureDetector(
              onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BottomBar(title: '',)));

              },
              child: Text("Done",style: TextStyle(color: Colors.amber),)): GestureDetector(
              onTap: () {
             _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);

              },
              child: Text("Next",style: TextStyle(color: Colors.amber),))
          ],
        ))
        ],
      )
    );
  }
}
