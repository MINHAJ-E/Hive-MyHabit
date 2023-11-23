import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
        // backgroundColor: bggrey,
        backgroundColor: Colors.amber,
        title:  const Text(
          "Terms Conditions",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white60),
        ),
      ),
      body:  const Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                // const Text('Terms and conditions',
                //     style:
                //         TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                // const SizedBox(
                //   height: 30,
                // ),
                Text(''' 
              Welcome to the Myhabit App! By using this app, you agree to these simple terms:

  1:- Use Responsibly: The my habit App is designed to help you store tasks .

  2:- Your Content: Any tasks you add are your responsibility. Make sure they are accurate and safe to use.

  3:- Respect Privacy: We care about your privacy. Your use of the app is subject to our Privacy Policy.

  4:- App Ownership: The my habit App and its content belong to us. Please don't modify, distribute, or reverse engineer the app without our permission.

  5:- App Changes: We might update the app or these terms. Stay tuned for any announcements from us.

  6:- App Availability: We aim to provide the app 24/7, but we can't guarantee it. We're not responsible for any inconvenience caused by app unavailability.

  7:- Get in Touch: If you have questions, reach out to us at minhajelayodath@gmail.com
 
  8:- if you face any issues after checkbox update please check and uncheck .after doing like this checkbox issue is solved

              By using the MYHABIT App, you agree to these terms. make good habits! ''' , style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white60))
              ],
            ),
          ),
        ),
      
      ),
    );
  }

 
}
