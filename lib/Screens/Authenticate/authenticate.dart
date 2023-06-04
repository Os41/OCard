import 'package:flutter/material.dart';
import 'package:o_card/constants.dart';
import 'login.dart';
import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  int showLogin = 0;

  void backView() {
    setState(() => showLogin = 0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    if (showLogin == 0) {
      return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: screenHeight,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.65,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                      ),
                      const FractionallySizedBox(
                        heightFactor: 0.8,
                        child: Image(
                          image: AssetImage('assets/images/splash.png'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(80, 0, 80, 10),
                        child: const Image(
                          image: AssetImage('assets/images/logo/logo-big.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.35,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: (screenHeight * 0.35) * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'O Card',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w700,
                                  color: Color(secondaryColor)
                              ),
                            ),
                            Text(
                              'Your first place to manage your expenses',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(gray)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: (screenHeight * 0.35) * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: () {setState(() => showLogin = 1);},
                              color: const Color(blueLC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
                              child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),),
                            ),
                            MaterialButton(
                              onPressed: () {setState(() => showLogin = 2);},
                              color: const Color(purpleLC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
                              child: const Text('Sign up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if(showLogin == 1){
      return Login(toggleView: backView);
    }else {
      return SignIn(toggleView: backView);
    }
  }
}
