import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
        // backgroundColor: bggrey,
        backgroundColor: Colors.amber,
        title: Text(
          "privacy Policy",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white60),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headings('Privacy Policy:'),
              spacing(5),
              content(
                  'Minhaj build MYHABIT as a Free app. This SERVICE is provided by Minhaj at no cost and is intended for use as is.'),
              spacing(5),
              content(
                  'This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.'),
              spacing(5),
              content(
                  'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at ToDo unless otherwise defined in this Privacy Policy.'),
              spacing(10),
              headings('Information Collection and Use:'),
              spacing(5),
              content(
                  'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Name . The information that I request will be retained on your device and is not collected by me in any way.The app does use third-party services that may collect information used to identify you.'),
              spacing(10),
              headings('Log data:'),
              spacing(5),
              content(
                  'I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.'),
              spacing(10),
              headings('Cookies:'),
              spacing(5),
              content(
                  "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
              spacing(10),
              headings('Service Providers:'),
              spacing(5),
              content(
                  'I may employ third-party companies and individuals due to the following reasons:'),
              spacing(20),
             
              spacing(10),
              content(
                  'I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose'),
              spacing(10),
              headings('Security:'),
              spacing(5),
              content(
                  'I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.'),
              spacing(10),
              headings('Links to Other Sites:'),
              spacing(5),
              content(
                  'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.'),
              spacing(10),
              headings("Childrens Privacy:"),
              spacing(5),
              content(
                  'These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.'),
              spacing(10),
              headings("Changes to This Privacy Policy"),
              spacing(5),
              content(
                  'I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.This policy is effective as of 2023-09-08'),
              spacing(10),
              headings("Contact Us"),
              spacing(10),
              content(
                  'If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at stranger99980@gmail.com.')
            ],
          ),
        ),
      ),
    );
  }

  Row servicePoints(String text3) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 8,
        ),
        SizedBox(
          width: 6,
        ),
        Text(text3),
      ],
    );
  }

  Text content(String text2) {
    return Text(text2,style: TextStyle(color: Colors.white38),);
  }

  SizedBox spacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  Text headings(String text1) {
    return Text(
      text1,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
    );
  }
}
