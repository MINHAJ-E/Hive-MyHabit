import 'package:flutter/material.dart';

class AddedItems extends StatelessWidget {
  final String habit;
  final String note;
  // final String category;
  // final String feedback;


  const AddedItems({
    required this .habit,
    required this.note,
    // required this.feedback,
    // required this.category,
   
  });
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        backgroundColor: Colors.amber,
        title: Text('ADDED ITEMS'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
             
              
              SizedBox(height: 30),
              CardItem(
                title: 'Habit',
                content: habit,
                
              ),
              CardItem(
                title: 'description',
                content: note,
              ),
              // CardItem(
              //   title: 'feedback',
              //   content: feedback,
              // ),
              // CardItem(
              //   title: 'category',
              //   content: category,
              // ),
             
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String content;

  const CardItem({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Colors.amber;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: bgColor,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:  TextStyle(
                  fontSize: 10,
                fontWeight: FontWeight.bold,
                
              ),
             
            ),
            SizedBox(height: 5),
            Text(
              content,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}