import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;

class Calender extends StatefulWidget {
  const Calender({Key? key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
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

  Widget horizontalCapsuleListView() {
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

  Widget topView() {
    return Container(
      height: height * 0.2,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.grey, // Change to the desired color
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          titleView(),
          horizontalCapsuleListView(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: topView(),
    );
  }
}
