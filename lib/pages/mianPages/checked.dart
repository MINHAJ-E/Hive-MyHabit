import 'package:flutter/material.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';

class CheckedTasksPage extends StatefulWidget {
  final List<HabitModel> checkedTasks;

  const CheckedTasksPage({super.key, required this.checkedTasks});

  @override
  State<CheckedTasksPage> createState() => _CheckedTasksPageState();
}

class _CheckedTasksPageState extends State<CheckedTasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 59, 59),
      appBar: AppBar(
        title: const Center(child: Text('Checked',style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body:  SizedBox(
                      height: 560,
                      child: Builder(
                        builder: (context) {
                          return ValueListenableBuilder<List<HabitModel>>(
                            valueListenable: habitListnotifier,
                            builder: (BuildContext ctx,
                                List<HabitModel> habitList, Widget? child) {
                                  final checkedTaskss =
                  habitList.where((taskss) => taskss.taskcomplete).toList();
                              return  checkedTaskss.isNotEmpty? ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    checkedTaskss.length,
                                    //  > 4 ? 4 : dailylist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  HabitModel data = checkedTaskss[index];
                                  return SizedBox(
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
                              ):const Center(child: Text('you are great',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),);
                            },
                          );
                        },
                      ),
                    ),
    );
  }
}