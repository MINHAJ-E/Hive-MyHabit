import 'package:flutter/material.dart';
import 'package:my_habit_app/db/functions/regularfunctions/dbregular_function.dart';
import 'package:my_habit_app/model/regular/regular_model.dart';

class RegularWork extends StatefulWidget {
   RegularWork({super.key});

  @override
  State<RegularWork> createState() => _RegularWorkState();
}

class _RegularWorkState extends State<RegularWork> {
      TextEditingController regularhabitcontroller = TextEditingController();

  TextEditingController regularnotecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
getAllregular();

    return Scaffold(
      backgroundColor: Color.fromARGB(137, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text( 
            'REGULAR WORK',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                      ),
                      // onChanged: (value) {
                      //   setState(() {
                      //     _search = value;
                      //   });
                      //   searchResult();
                      // },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => alert(context),
                      );
                    },
                    backgroundColor: Colors.amber,
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<RegularModel>>(
              valueListenable: regularlistnotifier,
              builder: (BuildContext context, List<RegularModel> todoList, _) {
                return ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final data = todoList[index];
                    return Container(
                      width: 200,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                data.regular,
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                data.note,
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               trailing: Checkbox(
                                                  value: data.isDone,
                                                  onChanged: (newvalue) {
                                                    setState(() async {
                                                      data.isDone = newvalue!;
                                                      addCheck(index, data);
                                                    });
                                                  },
                                                ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

   AlertDialog alert(BuildContext context) {
    return AlertDialog(
      title: const Text('ADD REGULAR '),
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: regularhabitcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: regularnotecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            saved();
            regularhabitcontroller.text = '';
            regularnotecontroller.text = '';
            Navigator.of(context).pop();
          },
          child: const Text('ADD'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('CANCEL'),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Future<void>saved()async{
    final _regularhabit =regularhabitcontroller.text.trim();
    final _regularnote =regularnotecontroller.text.trim();
    if(_regularhabit.isEmpty||_regularnote.isEmpty){
      return;
    }
    print('$_regularhabit $_regularnote');
  final regularwork=RegularModel(regular: _regularhabit,note: _regularnote,isDone: false);

    addregular(regularwork);
  }
}