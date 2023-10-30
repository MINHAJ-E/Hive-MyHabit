import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/db/functions/habitfunctions/dbhabit_functions.dart';
import 'package:my_habit_app/helpers/colors.dart';
import 'package:my_habit_app/model/habit/data_model.dart';

class HabitAdding extends StatefulWidget {
  const HabitAdding({super.key});

  @override
  State<HabitAdding> createState() => _HabitAddingState();
}

class _HabitAddingState extends State<HabitAdding> {
  final TextEditingController _habitAddController = TextEditingController();
  final TextEditingController _habitNoteController = TextEditingController();

   final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bggrey,
        appBar: AppBar(
          backgroundColor: bggreyisue,
        ),
        body: Center(
          
          child: SingleChildScrollView(
            child: Form(
                key: formkey,
              child: Column(
                children: [
                  const Text("consistency is key of the dicsipliine",
                  style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20) ,),
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
                                hintText: 'Add DAILYroutines ',
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
        ),
  
          );
        
  }



 Future<void> onAddHabitButtonClicked() async {
  final habit = _habitAddController.text.trim();
  final note = _habitNoteController.text.trim();
  DateTime now = DateTime.now();
String formattedDate = "${now.year}-${now.month}-${now.day}";


  if (habit.isEmpty ||
   note.isEmpty 

     ) {
    return;
  }

  final habitt = HabitModel(
    habit: habit, 
    note: note, 

    taskcomplete:false,
    lastUpdatedDate: '',
   
     );
  
  addhabit(habitt);

  setState(() {});

  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const BottomBar()));
     ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
       margin: EdgeInsets.all(10),
            backgroundColor: Color.fromARGB(255, 213, 216, 19),
    behavior: SnackBarBehavior.floating,
     content: Text("Your HAbIT is added ..."),
      ),
  );
}

}
