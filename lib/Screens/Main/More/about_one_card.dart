import 'package:flutter/material.dart';
import 'package:o_card/Widgets/Logo.dart';
import '../../../constants.dart';
import '../../../Widgets/text_Show.dart';

class AboutOneCard extends StatefulWidget {
  const AboutOneCard({Key? key}) : super(key: key);

  @override
  State<AboutOneCard> createState() => _AboutOneCardState();
}

class _AboutOneCardState extends State<AboutOneCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        90;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: screenHeight * 0.12,
                    decoration: const BoxDecoration(
                        color: Color(secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(35))),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 70,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  aboutOneCard),
                            ),
                            IconButton(
                                onPressed: () => {Navigator.pop(context)},
                                iconSize: 30,
                                icon: const Icon(Icons.arrow_forward_rounded,
                                    color: Colors.white)),
                          ]),
                    ),
                  ),
                ),
                logo(),
                TextShow(
                  label:
                      'At One Card, our mission is to simplify the way people manage their finances by providing a centralized hub for all financial information and transactions. Our vision is to create a world where managing multiple bank credit cards is no longer a headache. We aim to achieve this by developing a mobile application that integrates with multiple bank accounts and credit cards, allowing users to access payment details, track balances in real-time, and analyze expenses all in one place. Our app, the One Card app, also allows users to transfer funds between credit cards, set constraints and budget limits for each card, and have a virtual savings account within the app. With secure authentication and an easy-to-use interface, the One Card app streamlines the entire process of managing multiple bank credit cards and credit cards, making it easier for users to take control of their finances',
                  width: screenWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
