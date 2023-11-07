import 'package:flutter/material.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/checked.dart';
import 'package:my_habit_app/pages/mianPages/unchecked.dart';

class RegularWork extends StatefulWidget {
  const RegularWork({super.key});

  @override
  State<RegularWork> createState() => _RegularWorkState();
}

class _RegularWorkState extends State<RegularWork> {
   final String _search = '';
  List<HabitModel> searchedlist = [];

  @override
  void initState() {
    super.initState();

    getAllHabit();
    searchedlist = habitListnotifier.value;
  }

  void searchResult() {
    setState(() {
      searchedlist = habitListnotifier.value
          .where((incomigModel) => incomigModel.habit
              .toLowerCase()
              .contains(_search.toLowerCase()))
          .toList();
    });
  }

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