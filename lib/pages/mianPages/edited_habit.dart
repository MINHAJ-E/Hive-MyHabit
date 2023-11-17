// ignore_for_file: prefer_const_constructors
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/db/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/data_model.dart';
// import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/habit_addingpage.dart';

// ignore: must_be_immutable
class UpdateStudent extends StatefulWidget {
  final String habit;
  final String note;
  int index;

  UpdateStudent({
    super.key,
    required this.habit,
    required this.note,
    required this.index,
  });

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  TextEditingController habitController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  // final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    habitController = TextEditingController(text: widget.habit);
    noteController = TextEditingController(text: widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
        backgroundColor:bggreyisue,
        title: Text('EDIT detailes'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: habitController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'edit your  Habit',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: noteController,
                          decoration: const InputDecoration(
                            
                            border: InputBorder.none,
                            hintText: 'edit  description',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        
                        setState(() {
                          // saved();
                          update();
                        });
                       
                      //  Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text("Edited Habit"),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Future<void> update() async {
    final editedHabit = habitController.text.trim();
    final editedNote = noteController.text.trim();

    if (editedHabit.isEmpty || editedNote.isEmpty) {
      return;
    } else {
      final updated = HabitModel(
        taskcomplete: false,
        habit: editedHabit,
        note: editedNote,
    
       lastUpdatedDate: DateTime.now()

      );
 ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      const SnackBar(
                                                margin: EdgeInsets.all(10),
                                                backgroundColor: Colors.green,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                    "your task is edited"),
                                              ));
      editList(widget.index, updated);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BottomBar()));
    }
  }
}
