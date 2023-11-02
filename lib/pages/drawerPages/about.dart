import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      backgroundColor: bggrey,
        appBar: AppBar(
          // backgroundColor: bggreyisue,
          backgroundColor: Colors.amber,
          // backgroundColor: themeManager.primaryColor,
          title: const Text('About'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(
                        Icons.sports_basketball_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                makeSpace(40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'App Name:',
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
                    ),
                    Text('MYHABIT',style: TextStyle(color: Colors.white54),),
                  ],
                ),
                makeSpace(40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Version:',
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
                    ),
                    Text('20.0123',style: TextStyle(color: Colors.white54),),
                  ],
                ),
                makeSpace(40),
                hedings('Description:'),
                makeSpace(10),
                const Text(
                    "Todo App is a powerful and user-friendly to-do list app designed to help you stay organized and boost productivity. Whether you're managing personal tasks, work projects, or a combination of both, our app is here to simplify your life.",style: TextStyle(color: Colors.white54),),
                makeSpace(10),
                hedings('Features:'),
                makeSpace(10),
                featuresAdd(text1: 'Create and Manage Tasks:',text2: 'Quickly add, edit, and organize your to-do items with ease.',),
                featuresAdd(text1: 'Task Completion:',text2: 'Mark tasks as completed to track your progress.'),
                featuresAdd(text1: 'Task Notes:',text2: 'Add notes to tasks for additional details.'),
                featuresAdd(text1: 'Dark Mode:',text2:'Reduce eye strain and conserve battery life with our dark mode.' ),
                featuresAdd(text1: 'Privacy and Security:',text2: 'Rest assured that your data is secure and private.'),
                makeSpace(10),
                const Text(
                      'Contact:',
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
                    ),
                    makeSpace(10),
                    const Text('Have questions, feedback, or need assistance? Contact our support team at stranger99980@gmail.com',style: TextStyle(color: Colors.white54),),
                  makeSpace(15),
                  const Text(
                      'Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
                    ),
                    makeSpace(10),
                    const Text('Read our privacy policy page to learn how we protect your data and respect your privacy.',style: TextStyle(color: Colors.white54),),
                    makeSpace(15),
                  const Text(
                      'Rate and Review:',
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
                    ),
                    makeSpace(10),
                    const Text('Enjoying Todo App? Help us grow by rating and reviewing the app on the App Store or Google Play.',style: TextStyle(color: Colors.white54),),
                    makeSpace(25),
                    const Text("Thank you for choosing Todo App to simplify your task management and organization. We're committed to making your life easier, one task at a time.",style: TextStyle(color: Colors.white54),),
                    makeSpace(25),
                
              ],
            ),
          ),
        ));
  }

  Column featuresAdd({required String text1,String? text2}) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle,size: 6,),
                      const SizedBox(width: 10,),
                      Text(text1,style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white54),),
                    ],
                  ),
                  makeSpace(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(text2!,style: const TextStyle(color: Colors.white54),),
                    
                  ),
                  makeSpace(8),
                ],
              );
  }

  Text hedings(String text) {
    return Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
              );
  }

  SizedBox makeSpace(double? height) {
    return SizedBox(
      height: height,
    );
  }
}