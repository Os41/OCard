import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../Widgets/ChshBackLiesr.dart';
import '../../../Widgets/MaterialButton.dart';
import '../../../Widgets/text_Show_cashback.dart';

class Cashback extends StatefulWidget {
  const Cashback({Key? key}) : super(key: key);

  @override
  State<Cashback> createState() => _CashbackState();
}

class _CashbackState extends State<Cashback> {
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
                    height: screenHeight * 0.24,
                    decoration: const BoxDecoration(
                        color: Color(secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(35))),
                    child: Column(
                      children: [
                        Container(
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
                                      cashback),
                                ),
                                IconButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    iconSize: 30,
                                    icon: const Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white)),
                              ]),
                        ),
                        Container(
                          width: screenWidth,
                          padding: const EdgeInsets.only(left: 15),
                          child: const Text(
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              'Cashback Summary'),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          child: TextShowCach(
                            width: screenWidth / 3.6,
                            label: '''Pending\nCash back\n49.44''',
                          ),
                        ),
                        Container(
                          child: TextShowCach(
                            width: screenWidth / 3.6,
                            label: '''Confirmed\nCash back\n49.44''',
                          ),
                        ),
                        Container(
                          child: TextShowCach(
                            width: screenWidth / 3.6,
                            label: '''Paid\nCash back\n49.44''',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonApp(
                  label: 'Withdraw your Cashback',
                  onSaveButtonPressed: () {
                    print("Withdraw your Cashback button pressd");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight / 2,
                  child: CashBackList(),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
