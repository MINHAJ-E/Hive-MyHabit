// import 'dart:async';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/drawerPages/about.dart';
import 'package:my_habit_app/pages/drawerPages/contact_us.dart';
import 'package:my_habit_app/pages/drawerPages/privacy_policy.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/screens/logIn_Screens/app_firstscreen.dart';
import 'package:my_habit_app/pages/edited_habit.dart';
import 'package:my_habit_app/pages/mianPages/added_items.dart';
import 'package:my_habit_app/pages/mianPages/habit_addingpage.dart';
import 'package:my_habit_app/pages/search.dart';
// import 'package:my_habit_app/logIn_Screens/logIn_screen.dart';
// import 'package:my_habit_app/screens/pages/taskAddingPage.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;
import 'package:shared_preferences/shared_preferences.dart';

class TodayScreen extends StatefulWidget {
  // final String title;

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
  Color _cardColor = Colors.red;
  bool isLongPressed = false;
  bool isSelected = false;

  void _changeColor() {
    setState(() {
      _cardColor = Colors.blue;
    });
  }

  int selectedCardIndex = -1;
 
 
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
                            builder: (BuildContext ctx,List<HabitModel> habitList, Widget? child) {
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
                                                    borderRadius: BorderRadius.circular(20),
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
                                              borderRadius: BorderRadius.circular(20),
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
                                              borderRadius: BorderRadius.circular(20),
                                              icon: Icons.edit,
                                            )
                                          ],
                                        ),
                                        child: GestureDetector(
                                          onLongPress: () {
                                            setState(() {
                                              selectedCardIndex = index;
                                              isSelected =
                                                  !isSelected; // Toggle isSelected
                                            });
                                          },
                                          onDoubleTap: () {
                                            setState(() {
                                              selectedCardIndex = -1;
                                              isSelected
                                                  ? Colors.blue
                                                  : Colors.green;
                                            });
                                          },
                                          child: Card(
                                            color: selectedCardIndex == index
                                                ? const Color.fromARGB(
                                                    255, 117, 109, 72)
                                                : Colors.amber,
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(
        //       right: 25,
        //       bottom: 10,
        //       left: 10,
        //       top: 10,
        //     ),
        //     child: AnimSearchBar(
        //       textFieldColor: const Color.fromARGB(255, 46, 45, 42),
        //       searchIconColor: Colors.black,
        //       textFieldIconColor: Colors.amber,
        //       width: 200,
        //       textController: textcontroller,
        //       onSuffixTap: (value) {
        //         setState(() {
        //           _search = value;
        //         });
        //         searchResult();
        //       },
        //       onSubmitted: (value) {
        //         setState(() {
        //           _search = value;
        //         });
        //         searchResult(); // This is where you handle the submission action
        //       },
        //       color: Colors.white,
        //     ),
        //   )
        // ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 40, // Adjust the radius as per your preference
                        backgroundImage: AssetImage(
                            'assets/gym symbol.png'), // Add your asset image path here
                      ),
                      SizedBox(
                          height:
                              10), // Add some space between the CircleAvatar and Text
                      Text(
                        "MYHABIT",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  "Home ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const BottomBar(
                     
                    ),
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text(
                  "About",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const AboutPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text(
                  "Privacy policy",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const PrivacyPolicy(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_emergency),
                title: const Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const ContactUsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.restart_alt),
                title: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  resethabit(selectedCardIndex);
                  resetregular(selectedCardIndex);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const BottomBar()));
                },
              ),
              const SizedBox(
                height: 200,
              ),
              ListTile(
                trailing: const Icon(Icons.logout_outlined),
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  signout(context);
                },
              ),
            ],
          ),
        ),
      ),
  
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => const AppFirstScreen()),
      (route) => false,
    );
  }
  // AlertDialog alert(BuildContext context) {
  //   return AlertDialog(
  //     title: Text('reset  your values'),

  //     actions: [
  //       TextButton(
  //         onPressed: () {
  //          reset(selectedCardIndex);
  //           Navigator.of(context).pop();
  //         },
  //         child: Text('RESET'),
  //       ),
  //       TextButton(
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //         child: Text('CANCEL'),
  //       ),
  //     ],
  //     elevation: 24.0,
  //     backgroundColor: Colors.amber,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   );
  // }
  bottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color.fromARGB(255, 34, 32, 32),
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "choose your daily Hbits",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 102, 91, 91),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const HabitAdding()),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 10),
                            Text(
                              'create your own habit',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
