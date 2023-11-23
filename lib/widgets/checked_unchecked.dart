import 'package:flutter/material.dart';
import 'package:my_habit_app/model/data_model.dart';
import 'package:my_habit_app/views/pages/checked.dart';
import 'package:my_habit_app/views/pages/unchecked.dart';
// import 'package:my_habit_app/model/habit/data_model.dart';

// ignore: must_be_immutable
class RegularWork extends StatelessWidget {
   RegularWork({super.key});

double width = 0.0;

  double height = 0.0;

  List<HabitModel> dailylist = [];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

 return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor:Colors.amber,
          appBar: AppBar(
            backgroundColor: Colors.amber,
            automaticallyImplyLeading: false,
            elevation: 0,
            
          ),
          body: const Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Checked',
                  ),
                  Tab(
                    text: 'UnChecked',
                  ),
              
                ],
                indicatorColor: Colors.blue,
                // unselectedLabelColor: Colors.green,
              ),
              Expanded(
                child: TabBarView(children: [
                  // first Tab final uncheckedTaskss =
          
              
                 CheckedTasksPage(checkedTasks: [ ],),
                 //second Tab
                 UncheckedTasksPage(uncheckedTasks: [],),
        
                 
                  // Container(
                  //   child: Center(
                  //     child: Center(
                  //       child: Text('keep shoing tab'),
                  //     ),
                  //   ),
                  // )
                ]),
              )
            ],
          ),
        ));
}
}