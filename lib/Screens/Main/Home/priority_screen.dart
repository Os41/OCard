import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Models/credit_card.dart';
import '../../../Models/user.dart';
import '../../../Services/database.dart';
import '../../../constants.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/percentage_row.dart';

class PriorityScreen extends StatefulWidget {
  const PriorityScreen({Key? key}) : super(key: key);

  @override
  State<PriorityScreen> createState() => _PriorityScreenState();
}

class _PriorityScreenState extends State<PriorityScreen> {
  UserData? userData;
  List<CreditCard> creditCards = [];
  bool isEdit = false;
  var _errorMessage = '';
  List<String> userCards = [];
  List<String> copiedUserCards = [];

  void reorderData(int oldIndex, int newIndex){
    setState(() {
      _errorMessage = '';
    });

    if(isEdit) {
      setState(() {
        if(newIndex > oldIndex){
          newIndex -= 1;
        }
        final items = copiedUserCards.removeAt(oldIndex);
        copiedUserCards.insert(newIndex, items);
      });
    }else{
      setState(() {
        _errorMessage = 'You need to click on Edit first to start reorder.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if(user != null){
      DatabaseService(uid: user.uid).usersRef.child(user.uid).onValue.listen((event) {
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
        final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
        late List<CreditCard> formatData = [];

        if (data != null) {
          final Map<String, dynamic> convertedData = Map<String, dynamic>.from(data);

          convertedData.forEach((key, value) {
            final Map<String, dynamic> convertedCard = Map<String, dynamic>.from(value);
            formatData.add(CreditCard.fromMap(convertedCard));
          });

          setState(() {
            creditCards = formatData;
          });
        }
      });
      if(userData != null){
        setState(() {
          List<String> filteredList = userData!.cards.priorities.where((item) => item.isNotEmpty).toList();
          userCards = filteredList;
        });
      }
    }
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(hGreen),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(hGreen).withOpacity(0.6),
                const Color(lGreen),
                const Color(lGreen),
                const Color(lGreen),
                const Color(hGreen).withOpacity(0.6),
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
                                  icon: const Icon(Icons.arrow_forward_rounded)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 100,
                              height: 100,
                              child: const Image(
                                image: AssetImage('assets/images/shields/Priority-shield.png'),
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
                                  icon: const Icon(Icons.arrow_forward_rounded)),
                            ),
                          ],
                        )

                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Priority',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                    ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () => {
                              setState(() {
                                _errorMessage = '';
                                isEdit = !isEdit;
                                copiedUserCards = isEdit ? List.from(userCards) : [];
                              })
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.edit_rounded,
                                  color: Color(green),
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
                              color: Color(green),
                              shape: BoxShape.circle,
                            ),
                            child: isEdit ? const SizedBox() : IconButton(
                                onPressed: () {
                                  setState(() {
                                    _errorMessage = '';
                                  });
                                  if (userData!.cards.priorities.length < 4) {
                                    List<String> data = userData!.cards.cardsId.where((item) => item.isNotEmpty).toList();
                                    List<String> missingCid = findMissingCid(data, userCards);
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
                                                return PercentageRow(
                                                    cardNumber: getCardNumberOrName(creditCards, missingCid[index], false),
                                                    nickname: getCardNumberOrName(creditCards, missingCid[index], true),
                                                    isEdit: false,
                                                    isAdd: true,
                                                    initialValue: '',
                                                    color: secondaryColor,
                                                    onPressed: () {
                                                      DatabaseService(uid: user!.uid).addPrioritiesCard(missingCid[index]);
                                                      Navigator.of(context).pop();
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
                      height: 380,
                      child: ReorderableListView(
                        onReorder: reorderData,
                        children: <Widget>[
                          for (int i = 0; i < (isEdit ? copiedUserCards.length : userCards.length); i++)
                            PercentageRow(
                                key: ValueKey(i),
                                cardNumber: getCardNumberOrName(creditCards, isEdit ? copiedUserCards[i] : userCards[i], false),
                                nickname: getCardNumberOrName(creditCards, isEdit ? copiedUserCards[i] : userCards[i], true),
                                isEdit: isEdit,
                                initialValue: '',
                                controller: null,
                                color: pBlue,
                                onPressed: () {
                                  copiedUserCards.removeAt(i);
                                }
                            ),
                        ],
                      ),
                    ),
                    Text(_errorMessage, style: const TextStyle(
                        color: Color(hRed)
                    ),),
                    if (isEdit) Center(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                onPressed: () => {
                                  setState(() {
                                    _errorMessage = '';
                                    isEdit = !isEdit;
                                    copiedUserCards = isEdit ? List.from(userCards) : [];
                                  })
                                },
                                child: const Text('Cancel'),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  DatabaseService(uid: user!.uid).updatePrioritiesList(copiedUserCards.isEmpty ? [''] : copiedUserCards);
                                  setState(() {
                                    _errorMessage = '';
                                    isEdit = !isEdit;
                                    copiedUserCards = [];
                                  });
                                },
                                color: const Color(lGreen),
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
