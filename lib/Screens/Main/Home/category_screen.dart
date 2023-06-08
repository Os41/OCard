import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Models/category.dart';
import '../../../Models/credit_card.dart';
import '../../../Models/user.dart';
import '../../../Services/database.dart';
import '../../../constants.dart';
import '../../../Services/utils.dart';
import '../../../Widgets/percentage_row.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  UserData? userData;
  List<CreditCard> creditCards = [];
  int headerLabel = 0;
  bool isEdit = false;
  var _errorMessage = '';
  List userColors = [purple, hGreen, bOrange, pBlue];
  Category? userCards;
  List<String> copiedUserCards = [];

  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      _errorMessage = '';
    });

    if (isEdit) {
      setState(() {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final items = copiedUserCards.removeAt(oldIndex);
        copiedUserCards.insert(newIndex, items);
      });
    } else {
      setState(() {
        _errorMessage = 'You need to click on Edit first to start reorder.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      DatabaseService(uid: user.uid)
          .usersRef
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
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        late List<CreditCard> formatData = [];

        if (data != null) {
          final Map<String, dynamic> convertedData =
              Map<String, dynamic>.from(data);

          convertedData.forEach((key, value) {
            final Map<String, dynamic> convertedCard =
                Map<String, dynamic>.from(value);
            formatData.add(CreditCard.fromMap(convertedCard));
          });

          setState(() {
            creditCards = formatData;
          });
        }
      });
      if (userData != null) {
        setState(() {
          Category filteredCategory = Category(food: [], drinks: [], groceries: [], transportation: [], entertainment: [], education: [], health: [], shopping: [], home: [], utilities: [], inAppPurchases: [], financial: [], charitable: [], gifts: [], taxes: [], miscellaneous: []);
          for(var i = 0; i < 16; i++){
            List<String> filteredList = getCategoryType(userData!.cards.categories, i).where((item) => item.isNotEmpty).toList();
            filteredCategory = copyCategoryType(filteredCategory, i, filteredList)!;
          }
          userCards = filteredCategory;
        });
      }
    }
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(lightPurple),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(lightPurple).withOpacity(0.6),
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
                                  icon:
                                      const Icon(Icons.arrow_forward_rounded)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 100,
                              height: 100,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/shields/Category-shield.png'),
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
                                  icon:
                                      const Icon(Icons.arrow_forward_rounded)),
                            ),
                          ],
                        )),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
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
                                      _errorMessage = '';
                                      isEdit = !isEdit;
                                      copiedUserCards = isEdit
                                          ? List.from(getCategoryType(
                                              userCards, headerLabel))
                                          : [];
                                    })
                                  },
                                  child: const Row(
                                    children: [
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
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
                                        if (getCategoryType(userCards, headerLabel).length < 4) {
                                          List<String> data = userData!.cards.cardsId.where((item) => item.isNotEmpty).toList();
                                          List<String> missingCid = findMissingCid(data, getCategoryType(userCards, headerLabel));
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Add card'),
                                                  content: SizedBox(
                                                      height: 350,
                                                      width: 600,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            missingCid.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return PercentageRow(
                                                              cardNumber:
                                                                  getCardNumberOrName(
                                                                      creditCards,
                                                                      missingCid[
                                                                          index],
                                                                      false),
                                                              nickname:
                                                                  getCardNumberOrName(
                                                                      creditCards,
                                                                      missingCid[
                                                                          index],
                                                                      true),
                                                              isEdit: false,
                                                              isAdd: true,
                                                              initialValue: '',
                                                              color:
                                                                  secondaryColor,
                                                              onPressed: () {
                                                                DatabaseService(
                                                                        uid: user!
                                                                            .uid)
                                                                    .addCategoriesTypeCard(
                                                                        missingCid[
                                                                            index],
                                                                        categories[headerLabel]
                                                                            [
                                                                            'key']);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                        },
                                                      )),
                                                  actions: <Widget>[
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
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
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black12),
                              ),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: headerLabel == index
                                          ? const Color(darkPurple)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(35))),
                                  child: IconButton(
                                      onPressed: () => {
                                            setState(() {
                                              _errorMessage = '';
                                              headerLabel = index;
                                              copiedUserCards = [];
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
                      height: 350,
                      child: ReorderableListView(
                        onReorder: reorderData,
                        children: <Widget>[
                          for (int i = 0;
                              i <
                                  (isEdit
                                      ? copiedUserCards.length
                                      : getCategoryType(userCards, headerLabel)
                                          .length);
                              i++)
                            PercentageRow(
                                key: ValueKey(i),
                                cardNumber: getCardNumberOrName(
                                    creditCards,
                                    isEdit
                                        ? copiedUserCards[i]
                                        : getCategoryType(
                                            userCards, headerLabel)[i],
                                    false),
                                nickname: getCardNumberOrName(
                                    creditCards,
                                    isEdit
                                        ? copiedUserCards[i]
                                        : getCategoryType(
                                            userCards, headerLabel)[i],
                                    true),
                                isEdit: isEdit,
                                initialValue: '',
                                controller: null,
                                color: userColors[0],
                                onPressed: () {
                                  copiedUserCards.removeAt(i);
                                }),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            _errorMessage,
                            style: const TextStyle(color: Color(hRed)),
                          ),
                          if (isEdit)
                            Center(
                              child: Container(
                                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        onPressed: () => {
                                          setState(() {
                                            _errorMessage = '';
                                            isEdit = !isEdit;
                                            copiedUserCards = isEdit
                                                ? List.from(getCategoryType(
                                                    userCards, headerLabel))
                                                : [];
                                          })
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _errorMessage = '';
                                          });
                                          DatabaseService(uid: user!.uid)
                                              .updateCategoriesTypeList(
                                                  copiedUserCards.isEmpty
                                                      ? ['']
                                                      : copiedUserCards,
                                                  categories[headerLabel]
                                                      ['key']);
                                          setState(() {
                                            isEdit = !isEdit;
                                            copiedUserCards = [];
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
                            )
                          else
                            const SizedBox()
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
