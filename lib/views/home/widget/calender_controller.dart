import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/services/utils/colors_utils.dart';
import 'package:my_habit_app/services/utils/date_utils.dart' as date_util;

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


//title view month and year
Widget titleView() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Text(
      // changed to string interpolation
      '${date_util.DateUtils.months[currentDateTime.month - 1]} ${currentDateTime.year}',
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}

Widget hrizontalCapsuleListView(BuildContext context) {
  // double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return SizedBox(
    // screenWidth * 0.9,
    width: double.infinity,
    height: screenHeight * 0.1,
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
                date_util.DateUtils.weekdays[currentMonthList[index].weekday - 1],
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

Widget topView(BuildContext context) {
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
        hrizontalCapsuleListView(context),
      ],
    ),
  );
}
