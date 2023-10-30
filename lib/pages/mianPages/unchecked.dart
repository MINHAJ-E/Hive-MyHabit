import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/edited_habit.dart';

class UncheckedTasksPage extends StatefulWidget {
  final List<HabitModel> uncheckedTasks;

  UncheckedTasksPage({required this.uncheckedTasks});

  @override
  State<UncheckedTasksPage> createState() => _UncheckedTasksPageState();
}

class _UncheckedTasksPageState extends State<UncheckedTasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 59, 59),
      appBar: AppBar(
        title:Center(child: Text('UnChecked',style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body: Container(
                      height: 560,
                      child: Builder(
                        builder: (context) {
                          return ValueListenableBuilder<List<HabitModel>>(
                            valueListenable: habitListnotifier,
                            builder: (BuildContext ctx,
                                List<HabitModel> habitList, Widget? child) {
                                  final uncheckedTaskss =
                  habitList.where((task) => !task.taskcomplete).toList();
                              return uncheckedTaskss.isNotEmpty?
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    uncheckedTaskss.length,
                                    //  > 4 ? 4 : dailylist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  HabitModel data = uncheckedTaskss[index];
                                  return Container(
                                    width: 200,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.amber,
                                        child: SingleChildScrollView(
                                          child: ListTile(
                                            title: Center(
                                              child: Text(
                                                ' ${data.habit}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontStyle:
                                                      FontStyle.italic,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  fontSize: 23,
                                                ),
                                              ),
                                            ),
                                            subtitle: Center(
                                              child: Text(
                                                ' ${data.note}',
                                                style: const TextStyle(
                                                    color: bggrey),
                                              ),
                                            ),
                                       
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ):Center(child: Text('you are great',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),);
                            },
                          );
                        },
                      ),
                    ),
    );
  }
}
