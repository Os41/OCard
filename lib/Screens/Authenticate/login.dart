import 'package:flutter/material.dart';
import 'package:o_card/constants.dart';
import 'package:o_card/Services/auth.dart';

import '../../Services/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required void Function() toggleView})
      : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenHeight,
          color: Colors.brown,
          child: Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_rounded)),
              const Text('Login'),
              Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.85,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Color(secondaryColor),
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  var input = value!.trim();
                                  if (isStringEmpty(input)) {
                                    return 'Email name is required';
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
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Color(secondaryColor),
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  var input = value!.trim();
                                  if (isStringEmpty(input)) {
                                    return 'Password name is required';
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
              MaterialButton(
                onPressed: () {
                  AuthService().signInWithEmailAndPassword(_email, _password);
                },
                color: const Color(blueLC),
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
