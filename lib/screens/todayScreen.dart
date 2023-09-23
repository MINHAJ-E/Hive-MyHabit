import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_habit_app/drawerPages/contactUs.dart';
import 'package:my_habit_app/drawerPages/privacyPolicy.dart';
import 'package:my_habit_app/drawerPages/settings.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/pages/habitCategory.dart';
import 'package:my_habit_app/pages/taskAddingPage.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
        title: Text(
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
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: ListView(
            children:  [
              DrawerHeader(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    // image: AssetImage('assets/gym symbol.png'),
                    // fit: BoxFit.cover,
                    // ),
                    ),
                child: Center(
                  child: Text(
                    "MYHABIT",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  
                ),
                
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home ",style: TextStyle(fontSize: 20),
                ),
              
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TodayScreen()));
                }
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings",style: TextStyle(fontSize: 20),
                ),
              
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SettingsPage()));
                }
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text("Privacy policy",style: TextStyle(fontSize: 20),
                ),
              
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PrivacyPolicy()));
                }
              ),
              ListTile(
                leading: Icon(Icons.contact_emergency),
                title: Text("Contact Us",style: TextStyle(fontSize: 20),
                ),
              
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ContactUsPage()));
                }
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

  bottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: bggrey,
          height: 320.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "choose your daily rutine",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
