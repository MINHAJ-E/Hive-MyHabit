// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_habit_app/widgets/bottom_bar.dart';
import 'package:my_habit_app/controller/db/dbhabit_functions.dart';
import 'package:my_habit_app/views/drawer/about.dart';
import 'package:my_habit_app/views/drawer/contact_us.dart';
import 'package:my_habit_app/views/loginscreen/logIn_screen.dart';
import 'package:my_habit_app/views/drawer/privacy_policy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawerrr extends StatelessWidget {
   Drawerrr ({super.key});

   int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 650,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.amber,),
          
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
                      Text( "MYDAILY", style: TextStyle(
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
                    builder: (ctx) =>  const BottomBar(),
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
                  "Terms Conditions",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>  const TermsConditions(),
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
                height: 100,
              ),
              ListTile(
                trailing: const Icon(Icons.logout_outlined),
                title: const Text(
                  "Exit",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // exit(0);
                  SystemNavigator.pop();
                  // signout(context);
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenLogin()));
                },
              
              ),
            ],
          ),
        );
  }

   signout(BuildContext ctx) async {
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) =>  ScreenLogin()),
      (route) => false,
    );
  }

  AlertDialog alert(BuildContext context) {
    return AlertDialog(
      title: const Text('ARe you sure for rest your every thing',style: TextStyle(color: Colors.white),),
      // content: Text("ARe you sure for rest your every thing"),
      actions: [
        TextButton(
          onPressed: () {
          
            
                   Provider.of<DBProvider>(context, listen: false). resethabit(selectedCardIndex);
                    // resetregular(selectedCardIndex);
              
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) =>  ScreenLogin()));
          },
          child: const Text('RESET'),
        ),
        TextButton(
          onPressed: () {
           SystemNavigator.pop();
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
}