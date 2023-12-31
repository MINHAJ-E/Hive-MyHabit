import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_habit_app/views/home/widget/calender_controller.dart';
import 'package:my_habit_app/views/home/widget/dialogbox_controller.dart';
import 'package:my_habit_app/controller/db/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/data_model.dart';
import 'package:my_habit_app/controller/checkbox_priveder.dart';
import 'package:my_habit_app/views/edit/edited_habit.dart';
import 'package:my_habit_app/services/utils/date_utils.dart' as date_util;
import 'package:my_habit_app/widgets/bottom_sheet.dart';
import 'package:my_habit_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({
    Key? key,
  }) : super(key: key);
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
    Provider.of<DBProvider>(context, listen: false). getAllHabit();
    Provider.of<DBProvider>(context,listen: false). loadhabit(); 
    super.initState();
  }
  void filterList(String query) {
    Provider.of<DBProvider>(context,listen: false).filterList(query);
  }
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  bool? isDone = false;
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
      
    var checkrovider =Provider.of<CheckProvider>(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: topView(context),
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
                                  onChanged: (query) {
                                  filterList(query);
                                  }
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
                          return Consumer<DBProvider>(builder: (context, dbpro, child) {
                             return  dbpro. searchedlist.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:  dbpro. searchedlist.length,
                                      //  > 4 ? 4 : dailylist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        HabitModel data = dbpro. searchedlist[index];
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
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              alert(context,
                                                                  index),
                                                        );                                                   
                                                    },
                                                    backgroundColor: Colors.red,
                                                    icon: Icons.delete,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  SlidableAction(
                                                    onPressed: (context) {
                                                      Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            UpdateStudent(
                                                          habit: data.habit,
                                                          note: data.note,
                                                          index: index,
                                                        ),
                                                      ));
                                                    },
                                                    backgroundColor:Colors.white,
                                                    borderRadius:BorderRadius.circular(20),
                                                    icon: Icons.edit,
                                                  )
                                                ],
                                              ),
                                              child: GestureDetector(
                                                child: Card(
                                                  color: Colors.amber,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(10)),
                                                  child: SingleChildScrollView(
                                                    child: ListTile(
                                                        title: Center(
                                                          child: Text( ' ${data.habit}', style: const TextStyle(
                                                              color: Colors.white,
                                                              fontStyle: FontStyle.italic,
                                                              fontWeight: FontWeight .bold,
                                                              fontSize: 23,
                                                            ),
                                                          ),
                                                        ),
                                                        subtitle: Center(
                                                          child: Text( ' ${data.note}',
                                                            style: const TextStyle(
                                                            color: bggrey),
                                                          ),
                                                        ),
                                                        trailing: Checkbox(
                                                          value: data.lastUpdatedDate == null||!isSameDay(data
                                                              .lastUpdatedDate!, DateTime.now())
                                                              ? false
                                                              : data.taskcomplete,
                                                          onChanged:
                                                              (newvalue) {                                                          
                                                              DateTime now =  DateTime .now();
                                                              if (data.lastUpdatedDate ==  null ||
                                                                  !isSameDay(
                                                                      data.lastUpdatedDate!,  now)) {
                                                                data.taskcomplete = newvalue!;
                                                                data.lastUpdatedDate = now;
                                                              Provider.of<DBProvider>(context, listen: false).  addCheck(index, data);
                                                              } else {
                                                               checkrovider.checkk(data,newvalue);  
                                                              Provider.of<DBProvider>(context, listen: false).  updateCheck(
                                                                    index, data);
                                                              }                                                        
                                                          },
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        'your  list is empty',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
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
    ]),
     drawer:  Drawerrr(),
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