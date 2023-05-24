import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsConditionsList extends StatelessWidget {
  const TermsConditionsList();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Welcome to One Card Mobile App!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'These Terms and Conditions govern your use of the One Card Mobile App. By using the app, you accept these Terms and Conditions in full. If you disagree with these terms and conditions or any part of these terms and conditions, you must not use the app.',
          ),
          SizedBox(height: 16.0),
          Text(
            '1. Definitions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          ListTile(
            title: Text(
                '1.1 "One Card" or "we" means the company providing the One Card Mobile App.'),
          ),
          ListTile(
            title: Text(
                '1.2 "Mobile App" means the One Card application software, including all content and services made available to you through the app.'),
          ),
          ListTile(
            title: Text(
                '1.3 "User" or "you" means any individual who accesses or uses the Mobile App.'),
          ),
          SizedBox(height: 16.0),
          Text(
            '2. Use of the Mobile App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          ListTile(
            title: Text(
                '2.1 The Mobile App is provided for your personal use only.'),
          ),
          ListTile(
            title: Text(
                '2.2 You must be at least 18 years old to use the Mobile App.'),
          ),
          ListTile(
            title: Text(
                '2.3 You are responsible for ensuring that your use of the Mobile App complies with these Terms and Conditions and all applicable laws and regulations.'),
          ),
          ListTile(
            title: Text(
                '2.4 One Card reserves the right to modify or discontinue, temporarily or permanently, the Mobile App (or any part thereof) with or without notice.'),
          ),
          SizedBox(height: 16.0),
          Text(
            '3. User Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          ListTile(
            title: Text(
                '3.1 To use some of the features of the Mobile App, you may need to create a user account.'),
          ),
          ListTile(
            title: Text(
                '3.2 You must provide accurate, complete, and up-to-date information when creating your user account.'),
          ),
          ListTile(
            title: Text(
                '3.3 You are responsible for maintaining the confidentiality of your user account and password, and you agree to accept responsibility for all activities that occur under your account or password.'),
          ),
          ListTile(
            title: Text(
                '3.4 One Card reserves the right to refuse service, terminate accounts, remove or edit content, or cancel orders in its sole discretion.'),
          ),
          SizedBox(height: 16.0),
          Text(
            '4. Intellectual Property Rights',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          ListTile(
            title: Text(
                '4.1 One Card owns all intellectual property rights in the Mobile App and its content.'),
          ),
          ListTile(
            title: Text(
                '4.2 You may not use any content from the Mobile App for commercial purposes without obtaining a license from One Card.'),
          ),
          ListTile(
            title: Text(
                '4.3 You may not copy, reproduce, distribute, publish, display, perform, modify, or create derivative works from any part of the Mobile App without prior written consent from One Card.'),
          ),
          SizedBox(height: 16.0),
          Text(
            '5. Limitation of Liability',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          ListTile(
            title: Text(
                '5.1 One Card shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with the use or inability to use the Mobile App.'),
          ),
          ListTile(
            title: Text(
                '''5.2 One Card does not guarantee the accuracy, completeness, or timeliness of the Mobile App's content.'''),
          ),
          ListTile(
            title: Text(
                '5.3 One Card is not responsible for any damages or losses resulting from the use of.'),
          ),

          // Add remaining sections and content here
        ],
      ),
    );
  }
}
