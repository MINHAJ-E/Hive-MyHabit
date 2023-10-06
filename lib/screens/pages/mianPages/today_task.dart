import 'package:flutter/material.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/db/functions/taskfunctions/dbtask_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/task/data_model.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;


class TodayTAsk extends StatefulWidget {
  const TodayTAsk({super.key});

  @override
  State<TodayTAsk> createState() => _TodayTAskState();
}

class _TodayTAskState extends State<TodayTAsk> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =  ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }


  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        '${date_util.DateUtils.months[currentDateTime.month - 1]} ${currentDateTime.year}',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return Container(
      width: width,
      height: 100,
        child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Container(
            width: 80,
            height: 140,
            decoration: BoxDecoration(
                
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                
                ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),  
        ));
  }

  Widget topView() {
    return Container(
      height: height * 0.3,
      width: width,
      decoration: const BoxDecoration(
        color: bggreyisue,
       
        
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bggrey,
        body:CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: topView(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: height * 0.8,
              child: ValueListenableBuilder<List<TaskModel>>(
                valueListenable: taskListnotifier,
                builder: (BuildContext ctx, List<TaskModel> tasktList,
                    Widget? child) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: tasktList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 0), 
                    itemBuilder: (BuildContext context, int index) {
                      TaskModel data = tasktList[index];

                      return Container(
                        width: 200,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.amber,
                            child: ListTile(
                              title: Text(
                                ' ${data.task}',
                                style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,fontSize: 23),
                              ),
                              subtitle: Text(
                                ' ${data.note2}',
                                style: const TextStyle(color: bggrey),
                              ),
                               trailing: Row(
                                  mainAxisSize: MainAxisSize.min,

                                      children: [
                                         IconButton(
                              onPressed: () {
                                deletetask(index);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                             IconButton(
                                onPressed: () {
                                
                                },
                                icon: Icon(Icons.edit)),
                                      ],
                                    ),
                                    leading: Checkbox(value: true, onChanged: (bool){}),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
        
        );
  }


}