import 'package:flutter/material.dart';
import '../../../Data/constants.dart';
import 'about_one_card.dart';
import 'cashback.dart';
import 'help_and_support.dart';
import 'invite_friend.dart';
import 'my_qr_code.dart';
import 'privacy_policy.dart';
import 'profile_information.dart';
import 'terms_and_conditions.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 90;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.all(m5),
            width: double.infinity,
            height: screenHeight * 0.79,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileInformation()))
                  }, buttonText: profileInformation, iconData: Icons.person),
                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyQrCode()))
                  }, buttonText: myQrCode, iconData: Icons.qr_code),
                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Cashback()))
                  }, buttonText: cashback, iconData: Icons.money_rounded),

                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InviteFriend()))
                  }, buttonText: inviteFriend, iconData: Icons.connect_without_contact_rounded),
                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpAndSupport()))
                  }, buttonText: helpAndSupport, iconData: Icons.support_agent_rounded),
                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutOneCard()))
                  }, buttonText: aboutOneCard, iconData: Icons.info_outline_rounded),

                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndConditions()))
                  }, buttonText: termsAndConditions, iconData: Icons.file_copy_rounded),
                  OptionButton(onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()))
                  }, buttonText: privacyPolicy, iconData: Icons.privacy_tip_rounded),
                  OptionButton(onPressed: () => {}, buttonText: logOut, iconData: Icons.logout_rounded),
                ],
              ),
            )
        )
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final VoidCallback onPressed;

  const OptionButton({Key? key, required this.iconData, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: p20, vertical: p18),
        decoration: const BoxDecoration(
          border: Border(
            // top: BorderSide(width: 1.0, color: Colors.black26),
            bottom: BorderSide(width: 1.0, color: Colors.black26),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: p10, vertical: 0),
              child: Icon(iconData, color: const Color(secondaryColor)),
            ),
            Text(buttonText, style: const TextStyle(color: Color(primaryColor)),)
          ],
        ),
      ),
    );
  }
}
