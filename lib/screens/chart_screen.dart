import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/db/functions/regularfunctions/dbregular_function.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/model/regular/regular_model.dart';
// import 'package:my_habit_app/widgets/calender.dart';

class HabitChart extends StatefulWidget {
  const HabitChart({super.key});

  @override
  State<HabitChart> createState() => _HabitChartState();
}

class _HabitChartState extends State<HabitChart> {
  @override
  Widget build(BuildContext context) {
    // final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
       
        title: Text('Chart'),
        backgroundColor: Colors.amber,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // gradient: themeManager.primaryColorGradient,
          ),)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<HabitModel>>(
              future: getAllHabit(),
              builder: (context, snapshot) {
                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("'No task's available.'",style: TextStyle(color: Colors.white,fontSize: 25),));
                } else {
                  int completedTasks =
                      snapshot.data!.where((task) => task.taskcomplete).length;
                  int incompletedTasks =
                      snapshot.data!.where((task) => !task.taskcomplete).length;
                  int totalTasks = completedTasks + incompletedTasks;
      
                  double completed = (completedTasks / totalTasks) * 100;
                  double incompleted = (incompletedTasks / totalTasks) * 100;
      
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        width: 350,
                        height: 350,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: completed,
                                color:Colors.amber,
                                title: '${completed.toStringAsFixed(0)}%',titleStyle: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.w500),
                                radius: 40, 
                              ),
                              PieChartSectionData(
                                value: incompleted,
                                color:Colors.white24,
                                title: '${incompleted.toStringAsFixed(0)}%',titleStyle: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),
                                radius: 40, 
                              ),
                            ],
                            sectionsSpace: 2,
                            centerSpaceRadius: 90,
                            startDegreeOffset: 90,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 20,),
            chartValues(color: Colors.amber, text: "Completed Task's"),
            SizedBox(height: 40,),
            chartValues(color:Colors.white24, text: "Incomplete Task's"),
      
            FutureBuilder<List<RegularModel>>(
              future: getAllregular(),
              builder: (context, snapshot) {
                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("'No task's available.'",style: TextStyle(color: Colors.white,fontSize: 25),));
                } else {
                  int completedTasks =
                      snapshot.data!.where((task) => task.isDone).length;
                  int incompletedTasks =
                      snapshot.data!.where((task) => !task.isDone).length;
                  int totalTasks = completedTasks + incompletedTasks;
      
                  double completed = (completedTasks / totalTasks) * 100;
                  double incompleted = (incompletedTasks / totalTasks) * 100;
      
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        width: 350,
                        height: 350,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: completed,
                                color:Colors.amber,
                                title: '${completed.toStringAsFixed(0)}%',titleStyle: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.w500),
                                radius: 40, 
                              ),
                              PieChartSectionData(
                                value: incompleted,
                                color:Colors.white24,
                                title: '${incompleted.toStringAsFixed(0)}%',titleStyle: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),
                                radius: 40, 
                              ),
                            ],
                            sectionsSpace: 2,
                            centerSpaceRadius: 90,
                            startDegreeOffset: 90,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 20,),
            chartValues(color: Colors.amber, text: "Completed Task's"),
            SizedBox(height: 40,),
            chartValues(color:Colors.white24, text: "Incomplete Task's")
          ],
        ),
      ),
    );
  }

  Row chartValues({required Color color, String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(7)),
        ),
        SizedBox(width: 15,),
        Text(text!, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)
      ],
    );
  }
}

