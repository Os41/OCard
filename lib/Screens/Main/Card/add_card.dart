import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/constants.dart';
import 'package:o_card/Models/credit_card.dart';
import 'package:o_card/Services/database.dart';
import 'package:provider/provider.dart';

import '../../../Models/expiration_date.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/credit_card.dart';

class AddCard extends StatefulWidget {
  final int cid;
  final int ucid;
  const AddCard({Key? key, required this.cid, required this.ucid}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _cardHolderName = '';
  String _cardNumber = '';
  String _securityCode = '';
  int _expirationMonth = 0;
  int _expirationYear = 0;
  int randomNumber = getRandomNumber();

  handleSubmit(uid, cid) {
    CreditCard newCard =  CreditCard(
        cid: 'cid-123456$cid',
        uid: uid,
        cardholderName: _cardHolderName,
        cvv: _securityCode,
        balance: 0.0,
        cardNumber: _cardNumber,
        expirationDate: ExpirationDate(month: _expirationMonth, year: _expirationYear),
        cardType: detectCardType(_cardNumber),
        status: 'inactive',
        bankName: '',
        creditLimit: 20000.0,
        transactions: ['',]
    );
    DatabaseService(uid: uid).addNewCardToUser(context, widget.ucid, newCard);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(hGreen),
                Color(hGreen),
                Color(hGreen),
                Colors.white,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.15,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {Navigator.pop(context);},
                            iconSize: 24,
                            icon: const Icon(Icons.arrow_forward_rounded)),
                      ),
                    ),
                    const Text(
                      'New Card',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: CreditCardWidget(
                            cardNumber: _cardNumber,
                            expirationDate: ExpirationDate(month: _expirationMonth, year: _expirationYear),
                            cvv: _securityCode,
                            cardholderName: _cardHolderName,
                            styleNumber: randomNumber,
                            isCopy: false,
                          isSmall: true,
                        ),
                      ),
                      Center(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Card holder name',
                                    style: TextStyle(
                                        color: Color(secondaryColor),
                                        fontSize: 16),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Omar Saad',
                                  ),
                                  validator: (value) {
                                    var input = value!.trim();

                                    if (isStringEmpty(input)) {
                                      return 'Card holder name is required';
                                    }
                                    if(!containsOnlyLettersAndSpaces(input)) {
                                      return 'Card number must contain only letters';
                                    }
                                    if (!hasFirstAndLastName(input)) {
                                      return 'Card holder name should have first and last names';
                                    }
                                    return null;
                                  },
                                  onChanged: (text) {
                                    setState(() {
                                      _cardHolderName = text;
                                    });
                                  },
                                )
                              ],
                            )),
                      ),
                      Center(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Card number',
                                    style: TextStyle(
                                        color: Color(secondaryColor),
                                        fontSize: 16),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '1234 5678 9012 3456',
                                  ),
                                  validator: (value) {
                                    var input = value!.trim();

                                    if (isStringEmpty(input)) {
                                      return 'Card number is required';
                                    }
                                    if(!containsOnlyNumbers(input)) {
                                      return 'Card number must contain only numbers';
                                    }
                                    if (input.length != 13 && input.length != 16) {
                                      return 'Card number should be at least 13 or 16 digits';
                                    }
                                    return null;
                                  },
                                  onChanged: (text) {
                                    setState(() {
                                      _cardNumber = text;
                                    });
                                  },
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Security code',
                                        style: TextStyle(
                                            color: Color(secondaryColor),
                                            fontSize: 16),
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '123',
                                      ),
                                      validator: (value) {
                                        var input = value!.trim();

                                        if (isStringEmpty(input)) {
                                          return 'required';
                                        }
                                        if(!containsOnlyNumbers(input)) {
                                          return 'only numbers';
                                        }
                                        if (input.length != 3) {
                                          return 'should be 3 digits';
                                        }
                                        return null;
                                      },
                                      onChanged: (text) {
                                        setState(() {
                                          _securityCode = text;
                                        });
                                      },
                                    )
                                  ],
                                )),
                            SizedBox(
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Expiration date',
                                        style: TextStyle(
                                            color: Color(secondaryColor),
                                            fontSize: 16),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              border:
                                                  OutlineInputBorder(),
                                              hintText: 'YY',
                                            ),
                                            validator: (value) {
                                              var input = value!.trim();

                                              if (isStringEmpty(input)) {
                                                return 'required';
                                              }
                                              if(!containsOnlyNumbers(input)) {
                                                return 'only numbers';
                                              }
                                              if (input.length > 2) {
                                                return 'should be 2 digits';
                                              }
                                              if (int.parse(input) < 23 ) {
                                                return 'not be less than 23';
                                              }

                                              return null;
                                            },
                                            onChanged: (text) {
                                              setState(() {
                                                _expirationYear =
                                                    int.parse(text);
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              border:
                                                  OutlineInputBorder(),
                                              hintText: 'MM',
                                            ),
                                            validator: (value) {
                                              var input = value!.trim();

                                              if (isStringEmpty(input)) {
                                                return 'required';
                                              }
                                              if(!containsOnlyNumbers(input)) {
                                                return 'only numbers';
                                              }
                                              if (input.length > 2) {
                                                return 'at least 2 digits';
                                              }
                                              if (int.parse(input) == 0 || int.parse(input) > 12) {
                                                return 'not be 0 or greater than 12';
                                              }
                                              return null;
                                            },
                                            onChanged: (text) {
                                              setState(() {
                                                _expirationMonth =
                                                    int.parse(text);
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: 250,
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if(user != null){
                                  handleSubmit(user.uid, widget.cid);
                                }
                              }
                            },
                            color: const Color(secondaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_card_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Add Card',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
