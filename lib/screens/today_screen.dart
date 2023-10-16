import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/edited_habit.dart';
import 'package:my_habit_app/pages/mianPages/added_items.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;
import 'package:my_habit_app/widgets/bottom_sheet.dart';
import 'package:my_habit_app/widgets/drawer.dart';

class TodayScreen extends StatefulWidget {
  TodayScreen({Key? key, required}) : super(key: key);
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}
class _TodayScreenState extends State<TodayScreen> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> myhabit = <String>[];
  List<HabitModel> carddata = [];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    getAllHabit();
    searchedlist = habitListnotifier.value;
    super.initState();
  }

  String _search = '';
  List<HabitModel> searchedlist = [];

  void searchResult() {
    setState(() {
      searchedlist = habitListnotifier.value
          .where((incomingModel) =>
              incomingModel.habit.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }
//title view
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

  TextEditingController textcontroller = TextEditingController();

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
                                List<HabitModel> habitList, Widget? child) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: searchedlist.length,
                                // separatorBuilder:
                                //     (BuildContext context, int index) =>
                                //         const SizedBox(height: 0),
                                itemBuilder: (BuildContext context, int index) {
                                  HabitModel data = searchedlist[index];
                                  return Container(
                                    width: 200,
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                            motion: const DrawerMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: ((context) => {
                                                      addtoregularwork(data),
                                                    }),
                                                backgroundColor: Colors.white70,
                                                icon: Icons
                                                    .accessibility_new_sharp,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ]),
                                        startActionPane: ActionPane(
                                          motion: const StretchMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: ((context) =>
                                                  {deletehabit(index)}),
                                              backgroundColor: Colors.red,
                                              icon: Icons.delete,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            SlidableAction(
                                              onPressed: ((context) => {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          UpdateStudent(
                                                        habit: data.habit,
                                                        note: data.note,
                                                        index: index,
                                                      ),
                                                    ))
                                                  }),
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
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        AddedItems(
                                                      habit: data.habit,
                                                      note: data.note,
                                                      feedback: data.feedback,
                                                      category: data.category,
                                                      startdate: data.startdate,
                                                      enddate: data.enddate,
                                                    ),
                                                  ));
                                                },
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
                                                trailing: Checkbox(
                                                  value: data.taskcomplete,
                                                  onChanged: (newvalue) {
                                                    setState(() async {
                                                      data.taskcomplete =
                                                          newvalue!;
                                                      addCheck(index, data);
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
                              );
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
          "Today",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(31, 73, 62, 62),

      ),
      drawer: Drawerrr( ),
    );
  }

  bottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheettt();
      },
    );
  }
}
