import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottomBar.dart';
import 'package:my_habit_app/db/functions/dbFunctions.dart';
import 'package:my_habit_app/drawerPages/about.dart';
import 'package:my_habit_app/drawerPages/contactUs.dart';
import 'package:my_habit_app/drawerPages/privacyPolicy.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/logIn_Screens/appFirstScreen.dart';
import 'package:my_habit_app/logIn_Screens/logIn_Screen.dart';
import 'package:my_habit_app/model/dataModel.dart';
import 'package:my_habit_app/pages/habitCategory.dart';
import 'package:my_habit_app/pages/taskAddingPage.dart';
import 'package:my_habit_app/utils/colors_utils.dart';
import 'package:my_habit_app/utils/date_utils.dart' as date_util;
import 'package:shared_preferences/shared_preferences.dart';

class TodayScreen extends StatefulWidget {
  final String title;
  const TodayScreen({Key? key, required this.title}) : super(key: key);

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
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
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
              child: Column(
                children: [
                  Container(
                    height: height * 0.8,
                    child: ValueListenableBuilder<List<HabitModel>>(
                      valueListenable: habitListnotifier,
                      builder: (BuildContext ctx, List<HabitModel> habitList,
                          Widget? child) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: habitList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 0), // Return an empty container
                          itemBuilder: (BuildContext context, int index) {
                            HabitModel data = habitList[index];

                            return Container(
                              width: 200,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.amber,
                                  child: ListTile(
                                    title: Text(
                                      ' ${data.habit}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                      ),
                                    ),
                                    subtitle: Text(
                                      ' ${data.note}',
                                      style: TextStyle(color: bggrey),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    height: height * 0.8,
                    child: ValueListenableBuilder<List<TaskModel>>(
                      valueListenable: taskListnotifier,
                      builder: (BuildContext ctx, List<TaskModel> taskList,
                          Widget? child) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: taskList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 0), // Return an empty container
                          itemBuilder: (BuildContext context, int index) {
                            TaskModel data = taskList[index];

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
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    subtitle: Text(
                                      ' ${data.note2}',
                                      style: TextStyle(color: bggrey),
                                    ),
                                  ),
                                ),
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
        ],
      ),
      backgroundColor: bggrey,
      appBar: AppBar(
        title: const Text(
          "Today",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(31, 73, 62, 62),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(),
                child: Center(
                  child: Text(
                    "MYHABIT",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text(
                  "Home ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => BottomBar(
                      title: '',
                    ),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.adobe_outlined),
                title: const Text(
                  "About",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => AboutPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: const Text(
                  "Privacy policy",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => PrivacyPolicy(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_emergency),
                title: const Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ContactUsPage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 250,
              ),
              ListTile(
                trailing: Icon(Icons.logout_outlined),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomsheet(context);
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => AppFirstScreen()),
      (route) => false,
    );
  }

  bottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Color.fromARGB(255, 34, 32, 32),
          height: 320.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "choose your daily routine",
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
                          MaterialPageRoute(builder: (ctx) => HabitCategory()),
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
                  const Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => TaskAdding()),
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
                            Icon(Icons.task),
                            SizedBox(width: 10),
                            Text(
                              'create your own Task',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
