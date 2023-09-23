import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/pages/habitChart.dart';
import 'package:my_habit_app/pages/taskChart.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(240, 7, 7, 7),
          appBar: AppBar(
            
           backgroundColor: bggreyisue,
          ),
          body: Column(
            children: [
              Container(
                // color: Color.fromARGB(100, 100, 231, 198),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: 'Habit Chart',
                    ),
                    Tab(
                      text: 'Task Chart',
                    ),
                   
                  ],
                  indicatorColor: Colors.amber,
                  // unselectedLabelColor: Colors.green,
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  // first Tab
                 
                 //second Tab
                 HabitChart(),

                 TaskChart(),
                 
                ]),
              )
            ],
          ),
        ));
  }
 
}