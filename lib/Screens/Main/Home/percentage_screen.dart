import 'package:flutter/material.dart';
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
  bool isEdit = false;
  var _errorMessage = '';
  TextEditingController card1Controller = TextEditingController(text: '0');
  TextEditingController card2Controller = TextEditingController(text: '0');
  TextEditingController card3Controller = TextEditingController(text: '0');
  TextEditingController card4Controller = TextEditingController(text: '0');
  List userColors = [purple, hGreen, bOrange, pBlue];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var userCards = userAccount['cards']['percentages'];
    List userCardsController = [card1Controller, card2Controller, card3Controller, card4Controller];

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
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
                            onPressed: () => {Navigator.pop(context)},
                            iconSize: 24,
                            icon: const Icon(Icons.arrow_forward_rounded)),
                      ),
                    ),
                    const Text(
                      'Percentage',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    PercentageBar(percentageList: userCards),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () => {
                              setState(() {
                                isEdit = !isEdit;
                              })
                            },
                            child: Row(
                              children: const [
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
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(blue),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _errorMessage = '';
                                  });

                                  if (userCards.length < 4) {
                                    var data = userAccount['cards'];
                                    List missingCid = findMissingCids(data);

                                    showDialog( context: context, builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Add card'),
                                            content: SizedBox(
                                              height: 350,
                                              width: 600,
                                              child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: missingCid.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  var card = cards[missingCid[index]];
                                                  return PercentageRow(
                                                      cardNumber: getCardNumberFormat(card['card_number'].toString()),
                                                      nickname: getInitials(card['cardholder_name']),
                                                      isEdit: false,
                                                      isAdd: true,
                                                      initialValue: '',
                                                      color: secondaryColor,
                                                      onPressed: () {}
                                                  );
                                                },
                                              )
                                            ),
                                            actions: <Widget>[
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          );
                                    });
                                  }
                                  else {
                                      setState(() {
                                        _errorMessage = 'You can not add more than 4 cards';
                                      });
                                  }
                                },
                                iconSize: 30,
                                icon: const Icon(
                                  Icons.add_card_rounded,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
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
                        height: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: userCards.length,
                          itemBuilder: (BuildContext context, int index) {
                            var card = cards[userCards[index]['cid']];
                            return PercentageRow(
                                cardNumber: getCardNumberFormat(card['card_number'].toString()),
                                nickname: getInitials(card['cardholder_name']),
                                isEdit: isEdit,
                                initialValue: userCards[index]['percentage'].toString(),
                                controller: userCardsController[index],
                                color: userColors[index],
                                onPressed: () {}
                            );
                          },
                        )),
                    Text(_errorMessage, style: const TextStyle(
                        color: Color(hRed)
                    ),),
                    if (isEdit) Center(
                            child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MaterialButton(
                                      onPressed: () => {
                                        setState(() {
                                          isEdit = !isEdit;
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

                                        for(var cardController in userCardsController){
                                          if(cardController.text.length > 0){
                                            sum += int.parse(cardController.text);
                                          }
                                        }

                                        for(int i = 0; i < userCards.length; i++){
                                          if(userCardsController[i].text.length > 0){
                                            int num = int.parse(userCardsController[i].text);
                                            if(num <= 0){
                                              checkValidation = false;
                                            }
                                          }else{
                                            checkValidation = false;
                                          }
                                        }

                                        if(sum<100){
                                          setState(() {
                                            _errorMessage = 'The sum of all these percentages should be 100.';
                                          });
                                        }else if(sum > 100){
                                          setState(() {
                                            _errorMessage = 'The sum of all these percentages should not be more than 100.';
                                          });
                                        }else if(!checkValidation){
                                          setState(() {
                                            _errorMessage = 'Each card should have more than 0 percentage.';
                                          });
                                        }else{
                                          print('Changed perfectly');
                                          setState(() {
                                            isEdit = !isEdit;
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
                                )),
                          ) else const SizedBox()
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
