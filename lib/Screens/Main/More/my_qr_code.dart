import 'package:flutter/material.dart';
import '../../../Data/constants.dart';

class MyQrCode extends StatefulWidget {
  const MyQrCode({Key? key}) : super(key: key);

  @override
  State<MyQrCode> createState() => _MyQrCodeState();
}

class _MyQrCodeState extends State<MyQrCode> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 90;

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(m5),
                  width: double.infinity,
                  height: screenHeight * 0.12,
                  decoration: const BoxDecoration(
                      color: Color(secondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(br35))
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: m20),
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
                                    fontSize: fs16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                myQrCode
                            ),
                          ),
                          IconButton(
                              onPressed: () => {Navigator.pop(context)},
                              iconSize: is30,
                              icon: const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white
                              )
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
