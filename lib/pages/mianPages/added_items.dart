import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class AddedItems extends StatelessWidget {
  final String habit;
  final String note;
  final String category;
  final String feedback;
  final String startdate;
  final String enddate;


  const AddedItems({
    required this .habit,
    required this.note,
    required this.feedback,
    required this.category,
    required this.startdate,
    required this.enddate,
   
  });
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: bggrey,
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
                SizedBox(height: 20),
             Text("HAve a nice day...............",style: TextStyle(color: Colors.white),),
              
              SizedBox(height: 20),
              CardItem(
                title: 'Habit',
                content: habit,
                isAlternate: true,
                
              ),
              CardItem(
                title: 'description',
                content: note,
                isAlternate: false,
              ),
              CardItem(
                title: 'feedback',
                content: feedback,
                isAlternate: true,
              ),
              CardItem(
                title: 'category',
                content: category,
                isAlternate: false,
              ),
              CardItem(
                title: 'start date',
                content: startdate,
                isAlternate: true,
              ),
              CardItem(
                title: 'start date',
                content: enddate,
                isAlternate: false,
              ),
             
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
  final bool isAlternate;

  const CardItem({
    required this.title,
    required this.content,
     required this.isAlternate,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isAlternate ? Colors.amber : Color.fromARGB(255, 41, 37, 36);
    final textColor =
        isAlternate ? Color.fromARGB(255, 79, 24, 4) : Colors.white;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: bgColor,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style:  TextStyle(
                    fontSize: 15,
                  fontWeight: FontWeight.bold,color: Colors.white
                  
                ),
               
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,color: Colors.white
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}