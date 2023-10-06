import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/logIn_Screens/app_firstscreen.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
// import 'package:my_habit_app/logIn_Screens/splash_screen.dart';
// import 'package:my_habit_app/introPage/onBodyScreens/onbody_screens.dart';

const SAVE_KEY_NAME = 'USER logged IN';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if (!Hive.isAdapterRegistered(HabitModelAdapter().typeId)) {
    Hive.registerAdapter(HabitModelAdapter());
  }
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
          title: "MY HABIT",
          home: AppFirstScreen(),
    );
  }
}
