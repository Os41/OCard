import 'package:flutter/material.dart';
import '../../../Data/constants.dart';
import '../../../Widgets/MaterialButton.dart';
import '../../../Widgets/TextViwe.dart';
import '../../../Widgets/text_felid.dart';
import '../../../Widgets/text_felid_big.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
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
                                  helpAndSupport),
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
                SizedBox(
                  width: screenWidth,
                  child: TextApp(
                    lable: 'Name',
                  ),
                ),
                TextFelidApp(
                  icon: const Icon(Icons.person),
                  hint: 'Omare Saad',
                ),
                SizedBox(
                  width: screenWidth,
                  child: TextApp(
                    lable: 'Your proplem',
                  ),
                ),
                TextFelidbApp(
                  hint:
                      'Write the problem details with\n\na maximum of 500 characters',
                ),
                SizedBox(),
                Center(
                  child: ButtonApp(
                    label: 'Send ticite',
                    onSaveButtonPressed: () {
                      print('Send ticket button pressed');
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        size: 40,
                      ),
                      ButtonApp(
                        label: 'KSA Supoort',
                        onSaveButtonPressed: () {
                          print('KSA Supoort button pressed');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        size: 40,
                      ),
                      ButtonApp(
                        label: 'International Supoort',
                        onSaveButtonPressed: () {
                          print('International Supoort button pressed');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
