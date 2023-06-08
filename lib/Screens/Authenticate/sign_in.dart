import 'package:flutter/material.dart';
import '../../Services/auth.dart';
import '../../Services/utils.dart';
import '../../constants.dart';

class SignIn extends StatefulWidget {
  final Function() toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                          color: const Color(secondaryColor),
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            size: 40,
                          )),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Color(secondaryColor),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Let's Get Started 🚀",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(gray)),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 40),
                        child: const Image(
                          image: AssetImage('assets/images/logo/logo-big.png'),
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin:
                              const EdgeInsets.fromLTRB(12, 0, 12, 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          color: Color(secondaryColor),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      var input = value!.trim();
                                      if (isStringEmpty(input)) {
                                        return 'Email is required';
                                      }
                                      if (!isEmailValid(input)) {
                                        return 'Invalid email format';
                                      }
                                      return null;
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        _email = text;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin:
                              const EdgeInsets.fromLTRB(12, 0, 12, 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      'Password',
                                      style: TextStyle(
                                          color: Color(secondaryColor),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      var input = value!.trim();
                                      if (isStringEmpty(input)) {
                                        return 'Password is required';
                                      }
                                      if (!isPasswordValid(input)) {
                                        return 'Password should be at least 8 characters long';
                                      }
                                      return null;
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        _password = text;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(12, 90, 12, 10),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthService().registerWithEmailAndPassword(_email, _password);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: const Color(secondaryColor),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
