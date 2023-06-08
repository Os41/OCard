import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../Widgets/Logo.dart';
import '../../../Widgets/TermsCondition.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}
class _TermsAndConditionsState extends State<TermsAndConditions> {
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
                                  termsAndConditions),
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
                const Logo(),
                Container(
                  width: screenWidth - 15,
                  height: screenHeight - (screenHeight / 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.black54),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const TermsConditionsList(),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}