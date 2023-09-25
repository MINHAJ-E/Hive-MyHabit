import 'package:flutter/material.dart';
import 'package:my_habit_app/db/functions/dbFunctions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/dataModel.dart';
import 'package:my_habit_app/screens/todayScreen.dart';

class HabitAdding extends StatefulWidget {
  const HabitAdding({super.key});

  @override
  State<HabitAdding> createState() => _HabitAddingState();
}

class _HabitAddingState extends State<HabitAdding> {
  TextEditingController _habitAddController = TextEditingController();
  TextEditingController _habitNoteController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  void _showDatePickerStart() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  void _showDatePickerEnd() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bggrey,
        appBar: AppBar(
          backgroundColor: bggreyisue,
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
                          controller: _habitAddController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Make your own Habit',
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
                          controller: _habitNoteController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'give small description',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${_dateTime.month}/${_dateTime.year}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onTap: () {
                              _showDatePickerEnd();
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${_dateTime.month}/${_dateTime.year}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onTap: () {
                              _showDatePickerStart();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                       onAddHabitButtonClicked();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                      child: Text("Add Habit"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  Future<void>onAddHabitButtonClicked()async{
    final _habit = _habitAddController.text.trim();
    final _note = _habitNoteController.text.trim();
    if(_habit.isEmpty || _note.isEmpty){
      return;
    }
    // print('$_habit $_note');
   final habitt= HabitModel(habit: _habit, note: _note);
    addhabit(habitt);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TodayScreen(title: "")));
  }
}
