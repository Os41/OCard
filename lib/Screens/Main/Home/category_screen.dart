import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/percentage_row.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int headerLabel = 0;

  bool isEdit = false;
  var _errorMessage = '';
  List userColors = [purple, hGreen, bOrange, pBlue];
  var userCards = List<String>.from(userAccount['cards']['priorities']);

  void reorderData(int oldIndex, int newIndex){
    setState(() {
      _errorMessage = '';
    });

    if(isEdit) {
      setState(() {
        if(newIndex > oldIndex){
          newIndex -= 1;
        }
        final items = userCards.removeAt(oldIndex);
        userCards.insert(newIndex, items);
      });
    }else{
      setState(() {
        _errorMessage = 'You need to click on Edit first to start reorder.';
      });
    }
  }

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(purple),
                const Color(purple),
                const Color(purple),
                const Color(lightPurple).withOpacity(0.6),
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
                      'Category',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
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
                                    })
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.edit_rounded,
                                        color: Color(purple),
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
                                Text(
                                  categories[headerLabel]['label'],
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color(purple),
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
                          Container(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.0, color: Colors.black12),
                              ),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: headerLabel == index
                                          ? const Color(darkPurple)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(35))),
                                  child: IconButton(
                                      onPressed: () => {
                                        setState(() {
                                          headerLabel = index;
                                        })
                                      },
                                      color: headerLabel == index
                                          ? Colors.white
                                          : const Color(secondaryColor),
                                      icon: Icon(categories[index]['icon'])),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: ReorderableListView(
                        onReorder: reorderData,
                        children: <Widget>[
                          for(final item in userCards)
                            PercentageRow(
                                key: ValueKey(item),
                                cardNumber: getCardNumberFormat(cards[item]['card_number'].toString()),
                                nickname: getInitials(cards[item]['cardholder_name']),
                                isEdit: false,
                                initialValue: '',
                                controller: null,
                                color: userColors[0],
                                onPressed: () {}
                            ),
                        ],
                      ),
                    ),

                    SizedBox(
                      child: Column(
                        children: [
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
                                        print('Changed perfectly');
                                        setState(() {
                                          isEdit = !isEdit;
                                        });
                                      },
                                      color: const Color(purple),
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
                    )
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
