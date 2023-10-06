import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/db/functions/taskfunctions/dbtask_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/task/data_model.dart';
import 'package:my_habit_app/screens/pages/mianPages/today_task.dart';

class TaskAdding extends StatefulWidget {
  const TaskAdding({super.key});

  @override
  State<TaskAdding> createState() => _TaskAddingState();
}

class _TaskAddingState extends State<TaskAdding> {
   TextEditingController _taskAddController = TextEditingController();
  TextEditingController _taskNoteController = TextEditingController();

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
                          controller: _taskAddController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Make your own Task',
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
                          controller: _taskNoteController,
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
                       onAddtaskButtonClicked();
                      //  Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                      child: Text("Add Task"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

 Future<void>onAddtaskButtonClicked()async{
    final _habit = _taskAddController.text.trim();
    final _note = _taskNoteController.text.trim();
    if(_habit.isEmpty || _note.isEmpty){
      return;
    }
    // print('$_habit $_note');
   final tassk= TaskModel(task: _habit, note2: _note,
  //  isDone: false
   );
    addtask(tassk);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> BottomBar(title: "")));
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>bott))
  }
}