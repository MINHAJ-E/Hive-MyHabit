import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/pages/mianPages/habit_category.dart';
// import 'package:my_habit_app/screens/today_screen.dart';

class HabitAdding extends StatefulWidget {
  const HabitAdding({super.key});

  @override
  State<HabitAdding> createState() => _HabitAddingState();
}

class _HabitAddingState extends State<HabitAdding> {
  TextEditingController _habitAddController = TextEditingController();
  TextEditingController _habitNoteController = TextEditingController();
  TextEditingController _habitfeedbackController = TextEditingController();
  TextEditingController _startdateController = TextEditingController();
  TextEditingController _enddateController = TextEditingController();
   final formkey = GlobalKey<FormState>();

  DateTime _startdateTime = DateTime.now();
  DateTime _enddateTime = DateTime.now();

  void _showDatePickerStart() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _startdateTime = value!;
        _startdateController.text=formattDate(value);
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
        _enddateTime = value!;
        _enddateController.text=formattDate(value);
      });
    });
  }
  String formattDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bggrey,
        appBar: AppBar(
          backgroundColor: bggreyisue,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formkey,
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
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Make your own Habit',
                              ),
                            validator: (value){
                               if (value == null || value.isEmpty) {
                        return 'value is Empty';
                      }
                      return null;
                            },
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
                        height: 70, 
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _habitNoteController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'give small description',
                            ),
                             validator: (value){
                               if (value == null || value.isEmpty) {
                        return 'value is Empty';
                      }
                      return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 68,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _habitfeedbackController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'you can give Emoji related to your habit',
                            ),
                             validator: (value){
                               if (value == null || value.isEmpty) {
                        return 'value is Empty';
                      }
                      return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 55,
                        width: 320,
                          decoration: BoxDecoration(
                          color:  Colors.amber,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _startdateController,
                            
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                _showDatePickerStart(); // Changed comma to semicolon here
                                },
                              ),
                              hintText: 'Starting date',
                              hintStyle: const TextStyle(color: Colors.white),
                              
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 55,
                        width: 320,
                        decoration: BoxDecoration(
                          color:  Colors.amber,
                          borderRadius: BorderRadius.circular(30),   
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: _enddateController,  
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                _showDatePickerEnd(); // Changed comma to semicolon here
                                },
                              ),
                              hintText: 'End date',
                              hintStyle: const TextStyle(color: Colors.white),  
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                 
                        ],
                      ),
                      // const Divider(
                        // color: Colors.black,
                      ),
                    
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Padding(
                             padding: EdgeInsets.only(left: 30),
                             child: Text(
                               "Add category",
                               style: TextStyle(
                                   fontSize: 25,
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold),
                             ),
                           ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(child: Text("category")),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => alert(context),
                                );
                                // _showDatePickerEnd();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                              if (formkey.currentState!.validate()) {
                         onAddHabitButtonClicked();
                      } else {
                        print("data is empty");
                      }
                          
                          });
          
                          //  Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        child: const Text("Add Habit"),
                      )
                    ],
                  ),
          ),
              ),
  
          );
        
  }



 Future<void> onAddHabitButtonClicked() async {
  final _habit = _habitAddController.text.trim();
  final _note = _habitNoteController.text.trim();
  final _startdate = _startdateTime;
  final _enddate = _enddateTime;
  final _category = _habitNoteController.text.trim();
  final _feedback = _habitfeedbackController.text.trim();

  if (_habit.isEmpty ||
   _note.isEmpty ||
   _category.isEmpty ||
    _feedback.isEmpty 
    //  _startdate.isAfter(_dateTime)||
    //  _enddate.isBefore(_dateTime)
     ) {
    return;
  }

  final habitt = HabitModel(
    habit: _habit, 
    note: _note, 
    startdate: formattDate(_startdate),
    enddate:formattDate(_enddate),
    feedback: _feedback,
    category: _category,
    taskcomplete:false,
    date: DateTime.now(),
    isregular: false,
  
     );
  
  addhabit(habitt);

  setState(() {});

  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const BottomBar()));
     ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
       margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
     content: Text("Your HAbIT is added ..."),
      ),
  );
}


  AlertDialog alert(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black26,
      content: Container(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  categoryMethod(
                      text: "Football",
                      Categoryimage: 'assets/football.png',
                      context: context),
                  categoryMethod(
                      text: "Sports",
                      Categoryimage: 'assets/sports.png',
                      context: context),
                  categoryMethod(
                      text: "health",
                      Categoryimage: 'assets/health.png',
                      context: context),
                  categoryMethod(
                      text: "Home",
                      Categoryimage: 'assets/Home.png',
                      context: context),
                  categoryMethod(
                      text: "Entertainment",
                      Categoryimage: 'assets/entertainment.png',
                      context: context),
                  categoryMethod(
                      text: "Study",
                      Categoryimage: 'assets/study.png',
                      context: context),
                ],
              ),
              Column(
                children: [
                  categoryMethod(
                      text: "Work",
                      Categoryimage: 'assets/work.png',
                      context: context),
                  categoryMethod(
                      text: "Meditation",
                      Categoryimage: 'assets/meditation.png',
                      context: context),
                  categoryMethod(
                      text: "Nutrtion",
                      Categoryimage: 'assets/nutrition.png',
                      context: context),
                  categoryMethod(
                      text: "Gym",
                      Categoryimage: 'assets/gym symbol.png',
                      context: context),
                  categoryMethod(
                      text: "Others",
                      Categoryimage: 'assets/others.png',
                      context: context),
                  // categoryMethod(text: "ADD",Categoryimage:'assets/adddd habit category.png' ,context: context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }   
  Padding categoryMethod(
      {required String text,
      String? Categoryimage,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: whtgrey, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                CircleAvatar(
                  child: Image.asset(
                    Categoryimage!,
                    cacheHeight: 30, // Set the desired height 
                    cacheWidth: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
