import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/pages/habitAddingPage.dart';

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
              categoryMethod(text: "Football",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Sports",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "health",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Home",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Entertainment",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Study",Categoryimage:'assets/gym symbol.png' ,context: context),
              
            ],
          ),
          Column(
            children: [
              categoryMethod(text: "Work",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Meditation",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Nutrtion",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Gym",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "Others",Categoryimage:'assets/gym symbol.png' ,context: context),
              categoryMethod(text: "ADD",Categoryimage:'assets/gym symbol.png' ,context: context),
            
              
            ],
          ),
        ],
      )
      
    );
  }

  // Row categoryRow({required String text,String? Categoryimage}) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       categoryMethod(text: "dsfsd",Categoryimage: 'assets/gym symbol.png' ),
  //     // categoryMethod(text),
  //     ],
  //   );
  // }

  Padding categoryMethod({required String text, String? Categoryimage, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HabitAdding()));
        },
        child: Container(
          height: 50,
          width: 140,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Image.asset(Categoryimage!),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: whtgrey,
            borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}