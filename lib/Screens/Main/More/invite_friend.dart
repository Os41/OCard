import 'package:flutter/material.dart';
import '../../../constants.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
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
                                  inviteFriend),
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
                Center(
                  child: Image(
                    image:
                        const AssetImage('assets/images/invite _Friend.jpeg'),
                    height: screenHeight / 2,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFFFBFBFB),
                          border: Border.all(
                            width: 2,
                            color: Colors.black54,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        width: screenWidth - (screenWidth / 4),
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth - (screenWidth / 2.4),
                              child: const Text(
                                overflow: TextOverflow.ellipsis,
                                "USER_ ID ********",
                                style: TextStyle(fontSize: 24.0),
                              ),
                            ),
                            IconButton(
                              onPressed: onCopyPressed(),
                              icon: const Icon(
                                Icons.content_copy,
                                color: Colors.orange,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 30,
                      ),
                      Container(
                        width: screenWidth / 7,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: onSharePressed(),
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0XFFEEEEEE),
                    border: Border.all(
                      width: 2,
                      color: const Color(0XFF8B8B8B),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(13),
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "Total earned amount",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0XFF8B8B8B),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "0  SAR",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "Registered users : 0",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0XFF8B8B8B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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

onCopyPressed() {
  // print("copy icon  prissed");
}

onSharePressed() {
  // print("Share icon  prissed");
}
