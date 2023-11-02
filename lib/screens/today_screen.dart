import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/edited_habit.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;
import 'package:my_habit_app/widgets/bottom_sheet.dart';
import 'package:my_habit_app/widgets/drawer.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  //Monthlist
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  // DateTime dateSelected = DateTime.now();
  List<String> myhabit = <String>[];
  List<HabitModel> carddata = [];
  TextEditingController controller = TextEditingController();
  List<HabitModel> searchedlist = [];
  // List<HabitModel> habitList = [];
  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();

    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);

    
      getAllHabit();
      // dateWise(currentDateTime );
   
    searchedlist = habitListnotifier.value;
    super.initState();
  }
bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}
  String _search = '';

  void searchResult() {
    setState(() {
      searchedlist = habitListnotifier.value
          .where((incomingModel) =>
              incomingModel.habit.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }

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
            // dateSelected = currentMonthList[index];
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
  bool? isDone = false;
  bool isLongPressed = false;
  bool isSelected = false;
  bool isFirstTime = true;
  int selectedCardIndex = -1;
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: topView(),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              // Wrap your Column with Expanded to make it scrollable
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 260,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'search...',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _search = value;
                                  });
                                  searchResult();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: FloatingActionButton(
                              onPressed: () {
                                bottomsheet(context);
                              },
                              backgroundColor: Colors.amber,
                              mini: true,
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 440,
                      child: Builder(
                        builder: (context) {
                          return ValueListenableBuilder<List<HabitModel>>(
                            valueListenable: habitListnotifier,
                            builder: (BuildContext ctx,
                                List<HabitModel> habitlist, Widget? child) {
                              return  searchedlist.isNotEmpty? ListView.builder(
                                shrinkWrap: true,
                                itemCount: searchedlist.length,
                                //  > 4 ? 4 : dailylist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  HabitModel data = searchedlist[index];
                                  return Container(
                                    width: 200,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Slidable(
                                        startActionPane: ActionPane(
                                          motion: const StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                // setState(() {
                                                setState(() {
                                                  // deletehabit(index);

                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        alert(context, index),
                                                  );
                                                });

                                                // });
                                              },
                                              backgroundColor: Colors.red,
                                              icon: Icons.delete,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      UpdateStudent(
                                                    habit: data.habit,
                                                    note: data.note,
                                                    index: index,
                                                  ),
                                                ));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  margin: EdgeInsets.all(10),
                                                  backgroundColor: Colors.red,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Text(
                                                      "your task is edited"),
                                                ));
                                              },
                                              backgroundColor: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              icon: Icons.edit,
                                            )
                                          ],
                                        ),
                                        child: GestureDetector(
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
                                                trailing:Checkbox(
  value: data.lastUpdatedDate == null || 
         !isSameDay(data.lastUpdatedDate!, DateTime.now()) 
         ? false : data.taskcomplete,
  onChanged: (newvalue) {
    setState(() async {
      DateTime now = DateTime.now();
      if (data.lastUpdatedDate == null || 
          !isSameDay(data.lastUpdatedDate!, now)) {
        data.taskcomplete = newvalue!;
        data.lastUpdatedDate = now;
        addCheck(index, data);
      } else {
        setState(() {
          data.taskcomplete = newvalue!;
        });
        updateCheck(index, data);
      }
    });
  },
),




                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ):const Center(child: Text('your  is empty',
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,
                  color: Colors.white),),);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: bggrey,
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          "DAILY HABITS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(31, 73, 62, 62),
      ),
      drawer: const Drawerrr(),
    );
  }

  AlertDialog alert(BuildContext context, int index) {
    return AlertDialog(
      title: const Text(
        'ARe you sure for  Delete your task',
        style: TextStyle(color: Colors.white),
      ),
      // content: Text("ARe you sure for rest your every thing"),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              deletehabit(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  margin: EdgeInsets.all(10),
                  backgroundColor: Color.fromARGB(255, 213, 216, 19),
                  behavior: SnackBarBehavior.floating,
                  content: Text("Your HAbIT is DELETED"),
                ),
              );
            });
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

  bottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BottomSheettt();
      },
    );
  }
}
