import 'package:flutter/material.dart';
import 'package:my_habit_app/model/data_model.dart'; // Import the correct data model
import 'package:my_habit_app/controller/db/dbhabit_functions.dart';
import 'package:provider/provider.dart';

class UncheckedTasksPage extends StatelessWidget {
  final List<HabitModel> uncheckedTasks;

  const UncheckedTasksPage({Key? key, required this.uncheckedTasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 59, 59),
      appBar: AppBar(
        title: const Center(
          child: Text('UnChecked', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
          height: 560,
          child: Builder(
            builder: (context) {
              return Consumer<DBProvider>(
                builder: (context, dbProvider, _) {
                  final uncheckedTasks = dbProvider.searchedlist.where((taskss) => !taskss.taskcomplete).toList();
                  return uncheckedTasks.isNotEmpty
                      ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: uncheckedTasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          HabitModel data = uncheckedTasks[index];
                          return SizedBox(
                            width: 200,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: SingleChildScrollView(
                                  child: ListTile(
                                    title: Center(
                                      child: Text(
                                        ' ${data.habit}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Text(
                                        ' ${data.note}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'You are great',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
