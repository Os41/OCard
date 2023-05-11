import 'package:flutter/material.dart';

import '../../Data/constants.dart';

class Lock extends StatefulWidget {
  final Function toggleView;
  const Lock({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Lock> createState() => _LockState();
}

class _LockState extends State<Lock> {

  String _lockNumber = '';

  addNumber(String letter) {
    if(_lockNumber.length < 6) {
      setState(() {
        _lockNumber += letter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    if (_lockNumber.length == 6) {
      if(_lockNumber == '123456'){
        widget.toggleView();
      }else{
        print('Wrong number');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: m10),
                width: double.infinity,
                height: screenHeight * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          // do something
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(p16), // set the margin to 8 pixels on all sides
                          child: Icon(
                            Icons.exit_to_app,
                            color: Color(secondaryColor), // set the color to red
                          ),
                        )
                      ),
                    ),
                    const Center(
                        child: Image(
                          image: AssetImage('assets/images/logo-with-name.png'),
                          fit: BoxFit.cover,
                        ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: m10),
                            decoration: BoxDecoration(
                              color: _lockNumber.length > 0 ? const Color(primaryColor) : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(primaryColor),
                                width: 2.0,
                              ),
                            )
                        ),
                        Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: m10),
                            decoration: BoxDecoration(
                              color: _lockNumber.length > 1 ? const Color(primaryColor) : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(primaryColor),
                                width: 2.0,
                              ),
                            )
                        ),
                        Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: m10),
                            decoration: BoxDecoration(
                              color: _lockNumber.length > 2 ? const Color(primaryColor) : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(primaryColor),
                                width: 2.0,
                              ),
                            )
                        ),
                        Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: m10),
                            decoration: BoxDecoration(
                              color: _lockNumber.length > 3 ? const Color(primaryColor) : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(primaryColor),
                                width: 2.0,
                              ),
                            )
                        ),
                        Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: m10),
                            decoration: BoxDecoration(
                              color: _lockNumber.length > 4 ? const Color(primaryColor) : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(primaryColor),
                                width: 2.0,
                              ),
                            )
                        ),
                        Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.symmetric(horizontal: m10),
                            decoration: BoxDecoration(
                              color:  _lockNumber.length > 5 ? const Color(primaryColor) : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(primaryColor),
                                width: 2.0,
                              ),
                            )
                        ),
                      ],
                    ),
                    const SizedBox(width: m10),
                    GestureDetector(
                      onTap: () {
                        // do something
                      },
                      child: const Text(
                          'Forgot passcode?',
                          style: TextStyle(
                            color: Color(secondaryColor), // set the color to red
                          ),
                        ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: m10),
                width: double.infinity,
                height: screenHeight * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton(buttonText: '1', onPressed: () => addNumber('1')),
                        NumberButton(buttonText: '2', onPressed: () => addNumber('2')),
                        NumberButton(buttonText: '3', onPressed: () => addNumber('3')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton(buttonText: '4', onPressed: () => addNumber('4')),
                        NumberButton(buttonText: '5', onPressed: () => addNumber('5')),
                        NumberButton(buttonText: '6', onPressed: () => addNumber('6')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton(buttonText: '7', onPressed: () => addNumber('7')),
                        NumberButton(buttonText: '8', onPressed: () => addNumber('8')),
                        NumberButton(buttonText: '9', onPressed: () => addNumber('9')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton(buttonText: '', onPressed: () => {}),
                        NumberButton(buttonText: '0', onPressed: () => addNumber('0')),
                        NumberButton(buttonText: '', iconData: Icons.backspace_rounded, onPressed: () =>{
                         if(_lockNumber.isNotEmpty){
                           setState(() {
                             _lockNumber = _lockNumber.substring(0, _lockNumber.length - 1);
                           })
                         }
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}


class NumberButton extends StatelessWidget {
  final IconData? iconData;
  final String buttonText;
  final VoidCallback onPressed;

  const NumberButton({Key? key, this.iconData, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: buttonText.isNotEmpty || iconData != null ? onPressed : null,
        textColor: const Color(primaryColor),
        padding: const EdgeInsets.all(p20),
        child: iconData != null ?
          Icon(iconData) :
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: fs20,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
