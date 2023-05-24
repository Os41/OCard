import 'package:flutter/material.dart';
import '../../../Data/constants.dart';

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
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/images/invite _Friend.jpeg'),
                      height: screenHeight / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFBFBFB),
                          border: Border.all(
                            width: 2,
                            color: Colors.black54,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        width: screenWidth - (screenWidth / 4),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Container(
                              width: screenWidth - (screenWidth / 2.4),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                "USER_ ID ********",
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                            IconButton(
                              onPressed: onCopyPressed(),
                              icon: Icon(
                                Icons.content_copy,
                                color: Colors.orange,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 30,
                      ),
                      Container(
                        width: screenWidth / 6,
                        height: 68,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: onSharePressed(),
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0XFFEEEEEE),
                    border: Border.all(
                      width: 2,
                      color: Color(0XFF8B8B8B),
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                  ),
                  child: Center(
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
                        Container(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "0  SAR",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Registered users : 0",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0XFF8B8B8B),
                              fontWeight: FontWeight.bold,
                            ),
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
  print("copy icon  prissed");
}

onSharePressed() {
  print("Share icon  prissed");
}
