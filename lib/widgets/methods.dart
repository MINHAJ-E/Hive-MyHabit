import 'package:flutter/material.dart';
import 'package:my_habit_app/db/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/data_model.dart';
// import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;
double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  //Monthlist
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  // DateTime dateSelected = DateTime.now();
  // List<String> myhabit = <String>[];
  // List<HabitModel> carddata = [];
  TextEditingController controller = TextEditingController();
  List<HabitModel> searchedlist = [];
  // List<HabitModel> habitList = [];
  // @override
  // void initState() {
  //   currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
  //   currentMonthList.sort((a, b) => a.day.compareTo(b.day));
  //   currentMonthList = currentMonthList.toSet().toList();

  //   scrollController =
  //       ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
  //     getAllHabit();
  //     // dateWise(currentDateTime );
   
  //   searchedlist = habitListnotifier.value;
  //   super.initState();
  // }


//title view month and year
  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
// changed to string interpolatattion
        '${date_util.DateUtils.months[currentDateTime.month - 1]} ${currentDateTime.year}',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return SizedBox(
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
    
            currentDateTime = currentMonthList[index];
            // dateSelected = currentMonthList[index];
        
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
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? HexColor("465876")
                        : Colors.white,
                  ),
                ),
                Text(
                  date_util
                      .DateUtils.weekdays[currentMonthList[index].weekday - 1],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? HexColor("465876")
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topView() {
    return Container(
      height: height * 0.2,
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
        ],
      ),
    );
  }


   AlertDialog alert(BuildContext context, int index) {
    return AlertDialog(
      title: const Text(
        'Are you sure for  Delete your task',
        style: TextStyle(color: Colors.white),
      ),
      // content: Text("ARe you sure for rest your every thing"),
      actions: [
        TextButton(
          onPressed: () {
            // setState(() {
              deletehabit(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  margin: EdgeInsets.all(10),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  content: Text("Your HAbIT is DELETED"),
                ),
              );
            // });
          },
          child: const Text('delete'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
