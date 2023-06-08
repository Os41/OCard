import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const <Widget>[
        Text(
          'We, at One Card, are committed to protecting the privacy of our users. This Privacy Policy outlines how we collect, use, and protect your personal information in connection with your use of our mobile application and related services.Information We Collect: We collect various types of information from you when you use our mobile application and services, including but not limited to:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        ListTile(
          title: Text(
              '◉ Personal Information: Your name, email address, phone number, and other information you provide to us when you create an account.'),
        ),
        ListTile(
          title: Text(
              '◉ Financial Information: Your bank account details, credit card information, and other financial information you provide to us when you use our services.'),
        ),
        ListTile(
          title: Text(
              '◉ Usage Information: We may collect information about your usage of our services, including your transactions, spending history, and other user behavior data.'),
        ),
        ListTile(
          title: Text(
              '◉ Device Information: We may collect information about your device, such as your device type, operating system, and device identifiers.'),
        ),
        SizedBox(height: 16.0),
        Text(
          'How We Use Your Information: We may use your information in the following ways:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        ListTile(
          title: Text('◉ To provide and improve our services.'),
        ),
        ListTile(
          title: Text(
              '◉ To personalize your experience and provide you with customized content.'),
        ),
        ListTile(
          title: Text('◉ To process transactions and payments.'),
        ),
        ListTile(
          title: Text(
              '◉ To communicate with you about our services, promotions, and offers.'),
        ),
        ListTile(
          title: Text(
              '◉ To conduct research and analysis to improve our services and develop new features.'),
        ),
        ListTile(
          title: Text(
              '◉ To comply with legal obligations and protect our legal rights.'),
        ),
        SizedBox(height: 16.0),
        Text(
          'Security: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        ListTile(
          title: Text(
              '◉ We take the security of your personal information seriously and employ reasonable security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information. We use industry-standard encryption to protect your financial information and restrict access to your personal information to authorized personnel only.'),
        ),
        ListTile(
          title: Text(
              '◉ However, no security system is foolproof, and we cannot guarantee the security of your personal information. You acknowledge that you provide your personal information at your own risk.'),
        ),
        SizedBox(height: 16.0),
        Text(
          'Updates:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        ListTile(
          title: Text(
              'We reserve the right to update this Privacy Policy at any time, and any changes will be effective immediately upon posting. We encourage you to periodically review this Privacy Policy to stay informed of any updates or changes.'),
        ),
        SizedBox(height: 16.0),
        Text(
          'Contact:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        ListTile(
          title: Text(
              'If you have any questions or concerns regarding our Privacy Policy, please contact us at [contact email].'),
        ),
      ],
    );
  }
}