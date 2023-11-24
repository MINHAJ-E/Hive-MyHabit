import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_habit_app/views/pages/widget/chart_controller.dart';
import 'package:my_habit_app/controller/db/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/data_model.dart';
import 'package:provider/provider.dart';


class HabitChart extends StatelessWidget {
  const HabitChart({super.key});

  @override
  Widget build(BuildContext context) {
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
  
          ),)),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            FutureBuilder<List<HabitModel>>(
              future:Provider.of<DBProvider>(context, listen: false). getAllHabit(),
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
}

