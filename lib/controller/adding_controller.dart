

//  import 'package:flutter/material.dart';
// import 'package:my_habit_app/db/dbhabit_functions.dart';
// import 'package:my_habit_app/model/data_model.dart';
// import 'package:my_habit_app/widgets/bottom_bar.dart';

// Future<void> onAddHabitButtonClicked(BuildContext context) async {
//     final TextEditingController _habitAddController = TextEditingController();
//   final TextEditingController _habitNoteController = TextEditingController();
//   final habit = _habitAddController.text.trim();
//   final note = _habitNoteController.text.trim();
//   // DateTime now = DateTime.now();
// // String formattedDate = "${now.year}-${now.month}-${now.day}";


//   if (habit.isEmpty ||
//    note.isEmpty 

//      ) {
//     return;
//   }

//   final habitt = HabitModel(
//     habit: habit, 
//     note: note, 

//     taskcomplete:false,
//     lastUpdatedDate: DateTime.now(),
   
//      );
  
//   addhabit(habitt);



//   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const BottomBar()));
//      ScaffoldMessenger.of(context).showSnackBar(
//      const SnackBar(
//        margin: EdgeInsets.all(10),
//             backgroundColor: Colors.green,
//     behavior: SnackBarBehavior.floating,
//      content: Text("Your HAbIT is added ..."),
//       ),
//   );
// }
