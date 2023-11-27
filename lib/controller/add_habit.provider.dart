// import 'package:flutter/material.dart';
// import 'package:my_habit_app/controller/db/dbhabit_functions.dart';
// import 'package:my_habit_app/model/data_model.dart';
// import 'package:my_habit_app/widgets/bottom_bar.dart';
// import 'package:provider/provider.dart';

// class AddHabit extends ChangeNotifier{
  
//   final TextEditingController habitAddController = TextEditingController();

//   final TextEditingController habitNoteController = TextEditingController();
//   Future<void> onAddHabitButtonClicked(context) async {
//   final habit = habitAddController.text.trim();
//   final note = habitNoteController.text.trim();

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
  
// Provider.of<DBProvider>(context, listen: false).  addhabit(habitt);

//   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  const BottomBar()));
//      ScaffoldMessenger.of(context).showSnackBar(
//      const SnackBar(
//        margin: EdgeInsets.all(10),
//             backgroundColor: Colors.green,
//     behavior: SnackBarBehavior.floating,
//      content: Text("Your HAbIT is added ..."),
//       ),
//   );
// }
// }