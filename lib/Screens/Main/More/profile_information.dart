import 'package:flutter/material.dart';
import '../../../Models/user.dart';
import '../../../constants.dart';
import '../../../Widgets/MaterialButton.dart';
import '../../../Widgets/TextViwe.dart';
import '../../../Widgets/text_felid.dart';
import '../../../Widgets/text_felid_smole.dart';

class ProfileInformation extends StatefulWidget {
  final UserData? userData;
  const ProfileInformation({Key? key, this.userData}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
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
                                  profileInformation),
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 150.0,
                  child: Image(
                    image: AssetImage(widget.userData!.image),
                    width: 120,
                    height: 120.0,
                    fit: BoxFit.cover,
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
                  hint: widget.userData!.fullName,
                ),
                SizedBox(
                  width: screenWidth,
                  child: TextApp(
                    lable: 'ID',
                  ),
                ),
                TextFelidApp(
                  icon: const Icon(Icons.numbers),
                  hint: widget.userData!.puid,
                ),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: TextApp(
                          lable: 'PIN',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: TextApp(
                          lable: 'DBR',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: TextFelidSApp(
                          lable: 'PIN',
                          hint: widget.userData!.passcode,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: TextFelidSApp(
                          lable: 'MM',
                          hint: '01',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: TextFelidSApp(
                          lable: 'YYYY',
                          hint: '2000',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  child: TextApp(
                    lable: 'Phone',
                  ),
                ),
                TextFelidApp(
                  icon: const Icon(Icons.phone),
                  hint: widget.userData!.phoneNumber,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonApp(
                  label: 'Save',
                  onSaveButtonPressed: () {
                    print('Save button pressed');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
