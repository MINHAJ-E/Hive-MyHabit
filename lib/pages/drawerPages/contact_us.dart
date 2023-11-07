import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
        // backgroundColor: bggrey,
        backgroundColor: Colors.amber,
        title: const Text(
          "Contact US",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white60),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headings('Contact US'),
              spacing(5),
              content(
                  'Thank you for using My Habit! We value your feedback and are here to assist you with any questions, concerns, or suggestions you may have. Please feel free to get in touch with us using the following methods:.'),
              spacing(5),
              headings('Customer Support'),
              spacing(5),
              content(
                  'For general inquiries, feedback, or assistance, our customer support team is available to help you. You can reach us via email or through our in-app support chat:.'),
              spacing(10),
              content('EMAIL:-minhajelayodath@gmail.com'),
              spacing(10),
              headings('Technical Support'),
              spacing(5),
              content(
                  'If youre experiencing technical issues or have encountered a bug, please contact our technical support team. Be sure to provide as much detail as possible about the issue youre facing'),
              spacing(10),
              content('EMAIL:-minhajelayodath@gmail.com'),
              headings('Buisiness inquiries'),
              spacing(5),
              content(
                  "For partnership opportunities, advertising, or any business-related inquiries, please contact our business development team:minhajelayodath@gmail.com"),
              spacing(10),
              headings('Press and Media'),
              spacing(5),
              content(
                  'Members of the press or media outlets seeking information about My Habit can reach out to our media relations team:'),
              content('EMAIL:-minhajelayodath@gmail.com'),
              spacing(20),
                headings('Social Meadias'),
               content('Connect with us on social media for updates, tips, and community discussions:'),
               content('EMAIL:-minhajelayodath@gmail.com'),
               content('instagram :-minhaj_abdulla__'),
               content('LINKDIN :- Minhaj E'),
               content('git hub :- MINHAJ-E'),

            ],
          ),
        ),
      ),
    );
  }

  Row servicePoints(String text3) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 8,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(text3),
      ],
    );
  }

  Text content(String text2) {
    return Text(
      text2,
      style: const TextStyle(color: Colors.white38),
    );
  }

  SizedBox spacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  Text headings(String text1) {
    return Text(
      text1,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }
}
