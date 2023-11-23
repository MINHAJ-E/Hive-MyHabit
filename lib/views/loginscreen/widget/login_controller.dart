
  import 'package:flutter/material.dart';
import 'package:my_habit_app/main.dart';
import 'package:my_habit_app/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void checkLogin(BuildContext ctx) async {
    // String username = usernamecontroller.text;
    // final password = passwordcontroller.text;
   
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(SAVE_KEY_NAME, true);

      // ignore: use_build_context_synchronously
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) =>   BottomBar()));
      // Navigator.of(ctx)
      //     .pushReplacement(MaterialPageRoute(builder: (ctx1) =>  TodayScreen(username:username)));
   
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.amberAccent,
          behavior: SnackBarBehavior.floating,
          content: Text("successfully log in"))); 
  
  }