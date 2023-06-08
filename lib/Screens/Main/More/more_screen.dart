import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Services/auth.dart';
import 'package:provider/provider.dart';
import '../../../Models/user.dart';
import '../../../Services/database.dart';
import '../../../constants.dart';
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
  UserData? userData;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if(user != null){
      DatabaseService(uid: user.uid).usersRef.child(user.uid).onValue.listen((event) {
        final Map<dynamic, dynamic>? data =
        event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final Map<String, dynamic> convertedData =
          Map<String, dynamic>.from(data);

          final UserData formatData = UserData.fromMap(convertedData);
          setState(() {
            userData = formatData;
          });
        }
      });
    }
    Size size = MediaQuery
        .of(context)
        .size;
    double screenHeight = size.height - MediaQuery
        .of(context)
        .padding
        .top - MediaQuery
        .of(context)
        .padding
        .bottom - 90;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            height: screenHeight * 0.79,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ProfileInformation(userData: userData)))
                  }, buttonText: profileInformation, iconData: Icons.person),
                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MyQrCode(userData: userData)))
                  }, buttonText: myQrCode, iconData: Icons.qr_code),
                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const Cashback()))
                  }, buttonText: cashback, iconData: Icons.money_rounded),

                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const InviteFriend()))
                  },
                      buttonText: inviteFriend,
                      iconData: Icons.connect_without_contact_rounded),
                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HelpAndSupport(userData: userData)))
                  },
                      buttonText: helpAndSupport,
                      iconData: Icons.support_agent_rounded),
                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const AboutOneCard()))
                  },
                      buttonText: aboutOneCard,
                      iconData: Icons.info_outline_rounded),

                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const TermsAndConditions()))
                  },
                      buttonText: termsAndConditions,
                      iconData: Icons.file_copy_rounded),
                  OptionButton(onPressed: () =>
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy()))
                  },
                      buttonText: privacyPolicy,
                      iconData: Icons.privacy_tip_rounded),
                  OptionButton(onPressed: () => {
                  AuthService().signOut()
                  }, buttonText: logOut, iconData: Icons.logout_rounded),
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

  const OptionButton(
      {Key? key, required this.iconData, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black26),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Icon(iconData, color: const Color(secondaryColor)),
            ),
            Text(
              buttonText, style: const TextStyle(color: Color(secondaryColor)),)
          ],
        ),
      ),
    );
  }
}
