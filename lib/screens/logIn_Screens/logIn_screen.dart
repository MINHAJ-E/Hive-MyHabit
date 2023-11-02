// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenLogin extends StatelessWidget {
  ScreenLogin({
    super.key,
  });

  final usernamecontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  
  get username =>   usernamecontroller.text;
  
  // void _login(BuildContext context) {
  //   String name = usernamecontroller.text;
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => TodayScreen(name: name),
  //     ),
  //   );
  // }
  
  Object get currentState =>formkey ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            
            key: formkey,
            child: Center(
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                       borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                          controller: usernamecontroller,
                          decoration: const InputDecoration(
                            // fillColor: Colors.amber,
                              labelText: "   enter your Email",
                              border: InputBorder.none,
                              // hintText: "User NAme"
                              ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'value is Empty';
                            }
                            return null;
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                
                 
                  ElevatedButton.icon(
                    // &&username==currentState  
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          // print("data is empty");
                        }
                        
                      },
                      
                      icon: const Icon(Icons.check),
                      label: const Text("Log in"),style: const ButtonStyle(
                        backgroundColor:MaterialStatePropertyAll(Colors.amber)
                        ),),
                      
                ],
              ),
            ), 
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    // String username = usernamecontroller.text;
    // final password = passwordcontroller.text;
   
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(SAVE_KEY_NAME, true);

      // ignore: use_build_context_synchronously
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) =>  const BottomBar()));
      // Navigator.of(ctx)
      //     .pushReplacement(MaterialPageRoute(builder: (ctx1) =>  TodayScreen(username:username)));
   
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.amberAccent,
          behavior: SnackBarBehavior.floating,
          content: Text("successfully log in"))); 
  
  }
}
