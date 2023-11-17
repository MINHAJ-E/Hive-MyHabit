import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_habit_app/db/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/data_model.dart';
// import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/edited_habit.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;
import 'package:my_habit_app/widgets/bottom_sheet.dart';
import 'package:my_habit_app/widgets/drawer.dart';
import 'package:my_habit_app/widgets/methods.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key,}) : super(key: key);
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}
class _TodayScreenState extends State<TodayScreen> {
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
  bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}
  String _search = '';
  void searchResult() {
      searchedlist = habitListnotifier.value
          .where((incomingModel) =>
              incomingModel.habit.toLowerCase().contains(_search.toLowerCase()))
          .toList();
  }
  bool? isDone = false;
  // bool isLongPressed = false;
  // bool isSelected = false;
  // bool isFirstTime = true;
  // int selected Index = -1;
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
                          padding: const EdgeInsets.only(left: 1),
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
                  SizedBox(
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
                                return SizedBox(
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
                                              setState(() {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      alert(context, index),
                                                );
                                              });
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
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                          ),
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
                                                  setState(()  {
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
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ):const Center(child: Text('your  list is empty',
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
        backgroundColor: bggreyisue,
        elevation: 0,
      ),
      drawer: const Drawerrr(),
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
