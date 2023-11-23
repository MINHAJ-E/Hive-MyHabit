  import 'package:flutter/material.dart';
import 'package:my_habit_app/services/db/dbhabit_functions.dart';
import 'package:provider/provider.dart';

AlertDialog alert(BuildContext context, int index) {
    return AlertDialog(
      title: const Text(
        'Are you sure for  Delete your task',
        style: TextStyle(color: Colors.white),
      ),
      // content: Text("ARe you sure for rest your every thing"),
      actions: [
        TextButton(
          onPressed: () {
            // setState(() {
             Provider.of<DBProvider>(context, listen: false). deletehabit(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  margin: EdgeInsets.all(10),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  content: Text("Your HAbIT is DELETED"),
                ),
              );
            // });
          },
          child: const Text('delete'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
      ],
      elevation: 24.0,
      backgroundColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
