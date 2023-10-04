
// import 'package:flutter/material.dart';
// import 'package:my_habit_app/helpers/colors.dart';
// import 'package:my_habit_app/main.dart';
// import 'package:my_habit_app/onBodyScreens/onBody_Screens.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ScreenLogin extends StatelessWidget {
//   ScreenLogin({
//     super.key,
//   });

//   final usernamecontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bggrey,
//         body: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
            
//             key: formkey,
//             child: Center(
//               child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.amber,
//                        borderRadius: BorderRadius.circular(30)
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: TextFormField(
//                           controller: usernamecontroller,
//                           decoration: InputDecoration(
//                             // fillColor: Colors.amber,
//                               labelText: "   enter your Email",
//                               border: InputBorder.none,
//                               // hintText: "User NAme"
//                               ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'value is Empty';
//                             }
//                             return null;
//                           }),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(30)
//                   ),
                    
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: TextFormField(
//                           controller: passwordcontroller,
//                           maxLength: 10,
//                           obscureText: true,
//                           decoration: InputDecoration(
                           
//                             labelText: "  enter password",
//                             border: InputBorder.none,
                                
//                             // hintText: "Password",
//                             // helperText:"enter your password.",
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'value is empty';
//                             }
//                             return null;
//                           }),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton.icon(
                    
//                       onPressed: () {
//                         if (formkey.currentState!.validate()) {
//                           checkLogin(context);
//                         } else {
//                           print("data is empty");
//                         }
                        
//                       },
                      
//                       icon: Icon(Icons.check),
//                       label: Text("Log in"),style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.amber)),),
                      
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }

//   void checkLogin(BuildContext ctx) async {
//     final username = usernamecontroller.text;
//     final password = passwordcontroller.text;
//     if (username == password) {
//       final _sharedpref = await SharedPreferences.getInstance();
//       await _sharedpref.setBool(SAVE_KEY_NAME, true);

//       Navigator.of(ctx)
//           .pushReplacement(MaterialPageRoute(builder: (ctx1) => OnBodyScreen()));
//     } else {
//       ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
//           margin: EdgeInsets.all(10),
//           backgroundColor: Colors.red,
//           behavior: SnackBarBehavior.floating,
//           content: Text("username does not match")));
//     }
//   }
// }
