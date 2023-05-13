import 'package:flutter/material.dart';
import 'package:o_card/Data/constants.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController nameController = TextEditingController();
  String cardHolderName = '';
  String cardNumber = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.brown,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.2,
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
                            onPressed: () => {},
                            iconSize: 24,
                            icon: const Icon(Icons.arrow_forward_rounded)
                        ),
                      ),
                    ),
                    const Text(
                      'New Card',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Text(
                        'Adding an existing credit card',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Container(),
                    Center(
                      child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                    'Card holder name',
                                    style: TextStyle(
                                      color: Color(secondaryColor),
                                      fontSize: 16
                                    ),
                                ),
                              ),
                              TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Omar Saad'
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    cardHolderName = text;
                                  });
                                },
                              )
                            ],
                          )
                      ),
                    ),
                    Center(
                      child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Card number',
                                  style: TextStyle(
                                      color: Color(secondaryColor),
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '2345 2134 6546 5345'
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    cardNumber = text;
                                  });
                                },
                              )
                            ],
                          )
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
  }
}
