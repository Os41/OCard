import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Models/user.dart';
import 'package:o_card/Screens/Main/Home/percentage_screen.dart';
import 'package:provider/provider.dart';
import '../Services/database.dart';
import '../constants.dart';
import '../Models/card.dart';
import '../Screens/Main/Home/category_screen.dart';
import '../Screens/Main/Home/priority_screen.dart';
import '../Services/utils.dart';

class HeaderContainer extends StatefulWidget {
  final bool expand, option;
  final String title;
  final UserData? userData;
  final User? user;
  const HeaderContainer({Key? key, required this.title, required this.expand, required this.option, this.userData, this.user}) : super(key: key);

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer>{
  List<CreditCard> creditCards = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if(user != null){
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
    }
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 90;
    String headerStyle = widget.option ? 'L-HeaderStyle.png' : widget.expand ? 'M-HeaderStyle.png' : 'S-HeaderStyle.png';

    return Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          width: double.infinity,
          height: widget.option ? screenHeight * 0.49 : widget.expand ? screenHeight * 0.28 : screenHeight * 0.12,
          decoration: BoxDecoration(
              color: const Color(secondaryColor),
              image: DecorationImage(
                image: AssetImage('assets/images/$headerStyle'),
                fit: BoxFit.contain,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(35))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: widget.expand ? 5 : 0),
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            if(widget.expand) const TextSpan(text: 'Hello, '),
                            TextSpan(text: widget.title.isEmpty ? widget.userData!.fullName: widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: double.infinity,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              iconSize: 30,
                              icon: const Icon(
                                  Icons.notifications_active_rounded,
                                  color: Colors.white
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: GestureDetector(
                                onTap: () => {},
                                child: ClipOval(
                                  child: Image(
                                    image: AssetImage(widget.userData!.image),
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if(widget.expand) Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                        "Your total balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          getTotalBalance(
                              fetchTotalBalance(widget.user!.uid, creditCards)
                          ),
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      ),
                    )
                  ],
                ),
              ),
              if(widget.expand && widget.option) Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(25))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Color(purple),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen()))
                              },
                              iconSize: 30,
                              icon: const Icon(
                                  Icons.category_rounded,
                                  color: Colors.white
                              )
                          ),
                        ),
                        const Text('Category', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Color(pBlue),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PercentageScreen()))
                              },
                              iconSize: 30,
                              icon: const Icon(
                                  Icons.percent_rounded,
                                  color: Colors.white
                              )
                          ),
                        ),
                        const Text('Percentage', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Color(lGreen),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PriorityScreen()))
                              },
                              iconSize: 30,
                              icon: const Icon(
                                  Icons.sort_rounded,
                                  color: Colors.white
                              )
                          ),
                        ),
                        const Text('Priority', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
