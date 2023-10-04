import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/screens/pages/habit_addingpage.dart';

class HabitCategory extends StatelessWidget {
  const HabitCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
       backgroundColor: bggreyisue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              categoryMethod(text: "Football",Categoryimage:'assets/football.png' ,context: context),
              categoryMethod(text: "Sports",Categoryimage:'assets/sports.png' ,context: context),
              categoryMethod(text: "health",Categoryimage:'assets/health.png' ,context: context),
              categoryMethod(text: "Home",Categoryimage:'assets/Home.png' ,context: context),
              categoryMethod(text: "Entertainment",Categoryimage:'assets/entertainment.png' ,context: context),
              categoryMethod(text: "Study",Categoryimage:'assets/study.png' ,context: context),
              
            ],
          ),
          Column(  
            children: [
              categoryMethod(text: "Work",Categoryimage:'assets/work.png' ,context: context),
              categoryMethod(text: "Meditation",Categoryimage:'assets/meditation.png' ,context: context),
              categoryMethod(text: "Nutrtion",Categoryimage:'assets/nutrition.png' ,context: context),
              categoryMethod(text: "Gym",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Others",Categoryimage:'assets/others.png' ,context: context),
              categoryMethod(text: "ADD",Categoryimage:'assets/adddd habit category.png' ,context: context),
            
              
            ],
          ),
        ],
      )
      
    );
  }


  Padding categoryMethod({required String text, String? Categoryimage, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HabitAdding()));
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: whtgrey,
            borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                CircleAvatar(child: Image.asset(Categoryimage!,cacheHeight: 30, // Set the desired height
                  cacheWidth: 30, )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}