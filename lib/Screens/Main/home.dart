import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Data/constants.dart';
import 'package:o_card/Screens/Main/Card/cards_screen.dart';
import 'package:o_card/Screens/Main/More/more_screen.dart';
import '../../Widgets/header_container.dart';
import 'Home/home_screen.dart';

class MyHeader {
  String title;
  bool isExpanded;
  bool hasOption;

  MyHeader({required this.title, required this.isExpanded, required this.hasOption});
}

class Home extends StatefulWidget {
  final Function toggleView;
  const Home({Key? key, required this.toggleView}) : super(key: key);

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
  final name = 'Omar Saad';

  final List<MyHeader> MyHeaders = [
    MyHeader(title: 'Omar Saad', isExpanded: true, hasOption: true),
    MyHeader(title: 'Omar Saad', isExpanded: true, hasOption: false),
    MyHeader(title: more, isExpanded: false, hasOption: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderContainer(
                title: MyHeaders[_selectedIndex].title,
                expand: MyHeaders[_selectedIndex].isExpanded,
                option: MyHeaders[_selectedIndex].hasOption
            ),
            _selectedWidget,
          ],
        ),
      ),
      bottomNavigationBar: DiamondBottomNavigation(
        itemIcons: const [
          Icons.home,
          Icons.more_horiz,
        ],
        centerIcon: Icons.credit_card,
        selectedIndex: _selectedIndex,
        onItemPressed: onPressed,
      ),
    );
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const HomeScreen();
      }else if (index == 1) {
        _selectedWidget = const CardsScreen();
      }else if (index == 2) {
        _selectedWidget = const MoreScreen();
      }
    });
  }
}
