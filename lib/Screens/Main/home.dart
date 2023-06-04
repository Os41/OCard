import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/constants.dart';
import 'package:o_card/Models/card.dart';
import 'package:o_card/Screens/Main/Card/cards_screen.dart';
import 'package:o_card/Screens/Main/More/more_screen.dart';
import '../../Models/user.dart';
import '../../Widgets/header_container.dart';
import 'Home/home_screen.dart';

class Home extends StatefulWidget {
  final Function toggleView;
  final User user;
  final UserData? userData;
  final List<CreditCard>? creditCards;

  const Home(
      {Key? key,
      required this.toggleView,
      required this.user,
      required this.userData, this.creditCards})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;

  @override
  void initState() {
    _selectedWidget = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List myHeaders = [
      {
        'title': widget.userData == null ? '' : widget.userData!.fullName,
        'isExpanded': true,
        'isOption': true
      },
      {
        'title': widget.userData == null ? '' : widget.userData!.fullName,
        'isExpanded': true,
        'isOption': false
      },
      {'title': more, 'isExpanded': false, 'isOption': false}
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: widget.userData == null
                ? const Center(
                    child: Text('Loading...'),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderContainer(
                          title: myHeaders[_selectedIndex]['title'],
                          expand: myHeaders[_selectedIndex]['isExpanded'],
                          option: myHeaders[_selectedIndex]['isOption'],
                          userData: widget.userData,
                          user: widget.user,
                          creditCards: widget.creditCards
                      ),
                      _selectedWidget,
                    ],
                  ),
          ),
        ),
      ),
      bottomNavigationBar: DiamondBottomNavigation(
        itemIcons: const [
          Icons.home,
          Icons.more_horiz,
        ],
        centerIcon: Icons.credit_card,
        selectedIndex: _selectedIndex,
        selectedColor: const Color(pBlue),
        selectedLightColor: const Color(purpleLC),
        unselectedColor: const Color(secondaryColor),
        onItemPressed: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
              _selectedWidget =
                  const HomeScreen();
            } else if (index == 1) {
              _selectedWidget =
                  const CardsScreen();
            } else if (index == 2) {
              _selectedWidget =
                  const MoreScreen();
            }
          });
        },
      ),
    );
  }
}
