import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';


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
       toolbarHeight: 80,
        title: const Center(
          child: Text( 
            'CHART',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
       
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
                    child: Text("'No habit's available.'",style: TextStyle(color: Colors.white,fontSize: 25),));
                } else {
                  int completedTasks =
                      snapshot.data!.where((habit) => habit.taskcomplete).length;
                  int incompletedTasks =
                      snapshot.data!.where((habit) => !habit.taskcomplete).length;
                  int totalTasks = completedTasks + incompletedTasks;
      
                  double completed = (completedTasks / totalTasks) * 100;
                  double incompleted = (incompletedTasks / totalTasks) * 100;
      
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SizedBox(
                        width: 350,
                        height: 250,
                        child: PieChart(
                        swapAnimationDuration: const Duration(milliseconds: 800),
                         swapAnimationCurve: Curves.easeInOut,
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: completed,
                                color:Colors.amber,
                                title: '${completed.toStringAsFixed(0)}%',
                                titleStyle: const TextStyle(color:Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                                radius: 40, 
                              ),
                              PieChartSectionData(
                                value: incompleted,
                                color:Colors.white24,
                                title: '${incompleted.toStringAsFixed(0)}%',
                                titleStyle: const TextStyle(color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                                radius: 40, 
                              ),
                            ],
                            
                            sectionsSpace: 2,
                            centerSpaceRadius: 90,
                            //  centerText: 'Center Text', 
                            startDegreeOffset: 90,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 40,),
            chartValues(color: Colors.amber, text: "Completed Task's"),
            const SizedBox(height: 40,),
            chartValues(color:Colors.white24, text: "Incomplete Task's"),
            const SizedBox(height: 20,),
   
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
        const SizedBox(width: 15,),
        Text(text!, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)
      ],
    );
  }
}

