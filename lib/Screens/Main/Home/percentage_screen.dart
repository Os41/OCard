import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Models/card_list.dart';
import '../../../Models/credit_card.dart';
import '../../../Models/percentage.dart';
import '../../../Models/user.dart';
import '../../../Services/database.dart';
import '../../../constants.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/percentage_bar.dart';
import '../../../Widgets/percentage_row.dart';

class PercentageScreen extends StatefulWidget {
  const PercentageScreen({Key? key}) : super(key: key);

  @override
  State<PercentageScreen> createState() => _PercentageScreenState();
}

class _PercentageScreenState extends State<PercentageScreen> {
  UserData? userData;
  List<CreditCard> creditCards = [];
  List<Percentage>? userCards = [];
  List<Percentage> copiedUserCards = [];
  bool isEdit = false;
  var _errorMessage = '';
  TextEditingController card1Controller = TextEditingController(text: '0');
  TextEditingController card2Controller = TextEditingController(text: '0');
  TextEditingController card3Controller = TextEditingController(text: '0');
  TextEditingController card4Controller = TextEditingController(text: '0');
  List userColors = [purple, hGreen, bOrange, pBlue];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      DatabaseService(uid: user.uid).usersRef
          .child(user.uid)
          .onValue
          .listen((event) {
        final Map<dynamic, dynamic>? data =
        event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final Map<String, dynamic> convertedData =
          Map<String, dynamic>.from(data);

          final UserData formatData = UserData.fromMap(convertedData);
          setState(() {
            userData = formatData;
          });
        }
      });
      DatabaseService(uid: user.uid).cardsRef.onValue.listen((event) {
        final Map<dynamic, dynamic>? data = event.snapshot.value as Map<
            dynamic,
            dynamic>?;
        late List<CreditCard> formatData = [];

        if (data != null) {
          final Map<String, dynamic> convertedData = Map<String, dynamic>.from(
              data);

          convertedData.forEach((key, value) {
            final Map<String, dynamic> convertedCard = Map<String,
                dynamic>.from(value);
            formatData.add(CreditCard.fromMap(convertedCard));
          });

          setState(() {
            creditCards = formatData;
          });
        }
      });
      if (userData != null) {
        setState(() {
          List<Percentage>? filteredList = userData!.cards.percentages!.where((item) => item.cid.isNotEmpty).toList();
          userCards = filteredList;
        });
      }
    }
    Size size = MediaQuery
        .of(context)
        .size;
    double screenHeight = size.height -
        MediaQuery
            .of(context)
            .padding
            .top -
        MediaQuery
            .of(context)
            .padding
            .bottom;
    List userCardsController = [
      card1Controller,
      card2Controller,
      card3Controller,
      card4Controller
    ];

    return Scaffold(
      backgroundColor: const Color(seaBlue),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(seaBlue).withOpacity(0.6),
                const Color(pBlue),
                const Color(pBlue),
                const Color(pBlue),
                const Color(seaBlue).withOpacity(0.6),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.23,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: IconButton(
                                  onPressed: () => {},
                                  iconSize: 24,
                                  color: Colors.white.withOpacity(0),
                                  icon: const Icon(
                                      Icons.arrow_forward_rounded)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 100,
                              height: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/shields/Percentage-shield.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                  onPressed: () => {Navigator.pop(context)},
                                  iconSize: 24,
                                  icon: const Icon(
                                      Icons.arrow_forward_rounded)),
                            ),
                          ],
                        )

                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Percentage',
                        style:
                        TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.75,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () =>
                            {
                              setState(() {
                                _errorMessage = '';
                                isEdit = !isEdit;
                                copiedUserCards = (isEdit ? userCards : [])!;
                              })
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.edit_rounded,
                                  color: Color(darkBlue),
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(blue),
                              shape: BoxShape.circle,
                            ),
                            child: isEdit ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _errorMessage = '';
                                  });
                                  if (copiedUserCards.length < 4) {
                                    CardList data = userData!.cards;
                                    List<String> missingCid = findMissingCidPercentage(data.cardsId, data.percentages);
                                    showDialog(context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Add card'),
                                            content: SizedBox(
                                                height: 350,
                                                width: 600,
                                                child: ListView.builder(
                                                  scrollDirection: Axis
                                                      .vertical,
                                                  itemCount: missingCid.length,
                                                  itemBuilder: (
                                                      BuildContext context,
                                                      int index) {
                                                    return PercentageRow(
                                                        cardNumber: getCardNumberOrName(
                                                            creditCards,
                                                            missingCid[index],
                                                            false),
                                                        nickname: getCardNumberOrName(
                                                            creditCards,
                                                            missingCid[index],
                                                            true),
                                                        isEdit: false,
                                                        isAdd: true,
                                                        initialValue: '',
                                                        color: secondaryColor,
                                                        onPressed: () {
                                                          setState(() {
                                                            var newCard = Percentage(
                                                                cid: missingCid[index],
                                                                percentage: 0);
                                                            copiedUserCards.add(
                                                                newCard);
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                    );
                                                  },
                                                )
                                            ),
                                            actions: <Widget>[
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                  else {
                                    setState(() {
                                      _errorMessage =
                                      'You can not add more than 4 cards';
                                    });
                                  }
                                },
                                iconSize: 30,
                                icon: const Icon(
                                  Icons.add_card_rounded,
                                  color: Colors.white,
                                )) : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    isEdit ? PercentageBar(controllerList: userCardsController) :
                    PercentageBar(percentageList: userCards),
                    Center(
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(width: 1.0, color: Colors.black12),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Card number',
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 330,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: isEdit
                              ? copiedUserCards.length
                              : userCards!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var cardRow = isEdit
                                ? copiedUserCards[index]
                                : userCards![index];
                            return PercentageRow(
                                cardNumber: getCardNumberOrName(
                                    creditCards, cardRow.cid, false),
                                nickname: getCardNumberOrName(
                                    creditCards, cardRow.cid, true),
                                isEdit: isEdit,
                                initialValue: cardRow.percentage.toString(),
                                controller: userCardsController[index],
                                color: userColors[index],
                                onPressed: () {
                                  copiedUserCards.removeAt(index);
                                  userCardsController[index].text = '0';
                                }
                            );
                          },
                        )),
                    Text(_errorMessage, style: const TextStyle(
                        color: Color(hRed)
                    ),),
                    if (isEdit) Center(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () =>
                            {
                              setState(() {
                                _errorMessage = '';
                                isEdit = !isEdit;
                                copiedUserCards = [];
                              })
                            },
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                _errorMessage = '';
                              });
                              var sum = 0;
                              var checkValidation = true;
                              for (var cardController in userCardsController) {
                                if (cardController.text.length > 0) {
                                  sum += int.parse(cardController.text);
                                }
                              }

                              for (int i = 0; i <
                                  copiedUserCards.length; i++) {
                                if (userCardsController[i].text.length >
                                    0) {
                                  int num = int.parse(
                                      userCardsController[i].text);
                                  if (num <= 0) {
                                    checkValidation = false;
                                  }
                                } else {
                                  checkValidation = false;
                                }
                              }

                              if (sum < 100) {
                                setState(() {
                                  _errorMessage =
                                  'The sum of all these percentages should be 100.';
                                });
                              } else if (sum > 100) {
                                setState(() {
                                  _errorMessage =
                                  'sum these percentages should not be more than 100.';
                                });
                              } else if (!checkValidation) {
                                setState(() {
                                  _errorMessage =
                                  'Each card should have more than 0 percentage.';
                                });
                              } else {
                                for (int i = 0; i <
                                    copiedUserCards.length; i++) {
                                  if (userCardsController[i].text.length >
                                      0) {
                                    int num = int.parse(
                                        userCardsController[i].text);
                                    copiedUserCards[i].setPercentage(num);
                                  }
                                }
                                DatabaseService(uid: user!.uid)
                                    .updatePercentagesList(copiedUserCards.isEmpty ? [] : copiedUserCards);
                                setState(() {
                                  _errorMessage = '';
                                  isEdit = !isEdit;
                                  copiedUserCards = [];
                                });
                              }
                            },
                            color: const Color(darkPurple),
                            child: const Text(
                              'Change',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ) else
                      const SizedBox()
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
