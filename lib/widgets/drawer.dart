import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/pages/drawerPages/about.dart';
import 'package:my_habit_app/pages/drawerPages/contact_us.dart';
import 'package:my_habit_app/pages/drawerPages/privacy_policy.dart';
import 'package:my_habit_app/screens/logIn_Screens/app_firstscreen.dart';
// import 'package:my_habit_app/pages/logIn_Screens/app_firstscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawerrr extends StatefulWidget {
  const Drawerrr ({super.key});

  @override
  State<Drawerrr> createState() => _DrawerState();
}

class _DrawerState extends State<Drawerrr> {
   int selectedCardIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        radius: 40, 
                        backgroundImage: AssetImage(
                            'assets/gym symbol.png'), 
                      ),
                      SizedBox( height: 10),
                      Text( "MYHABIT", style: TextStyle(
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
                    builder: (ctx) => const BottomBar(),
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
                
                    showDialog(
                                context: context,
                                builder: (context) => alert(context),
                              );
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
                    SystemNavigator.pop();
                },
              
              ),
            ],
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

  AlertDialog alert(BuildContext context) {
    return AlertDialog(
      title: Text('ARe you sure for rest your every thing',style: TextStyle(color: Colors.white),),
      // content: Text("ARe you sure for rest your every thing"),
      actions: [
        TextButton(
          onPressed: () {
          
            setState(() {
                    resethabit(selectedCardIndex);
                    resetregular(selectedCardIndex);
                  });
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => const BottomBar()));
          },
          child: Text('RESET'),
        ),
        TextButton(
          onPressed: () {
           SystemNavigator.pop();
          },
          child: Text('CANCEL'),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}