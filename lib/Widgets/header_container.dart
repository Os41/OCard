import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Data/constants.dart';
import 'package:dotted_border/dotted_border.dart';

const double balance_1 = 10000.00;
const double balance_2 = 498.00;
const double balance_3 = 14000.00;
const double balance_4 = 50000.00;

class HeaderContainer extends StatefulWidget {
  final bool expand, option;
  final String title;
  const HeaderContainer({Key? key, required this.title, required this.expand, required this.option}) : super(key: key);

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer>{

  final List<double> listOfCardsBalance = [balance_1, balance_2, balance_3, balance_4];

  String getTotalBalance() {
    double sum = 0.00;
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');

    for (int i = 0; i < listOfCardsBalance.length; i++) {
      sum += listOfCardsBalance[i];
    }

    String formattedNumber = formatter.format(sum);

    return "\$ $formattedNumber";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 90;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(m5),
        width: double.infinity,
        height: widget.option ? screenHeight * 0.49 : widget.expand ? screenHeight * 0.28 : screenHeight * 0.12,
        decoration: const BoxDecoration(
            color: Color(secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(br35))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: m20, vertical: widget.expand ? m5 : 0),
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
                          fontSize: fs16,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          if(widget.expand) const TextSpan(text: 'Hello, '),
                          TextSpan(text: widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () => {},
                            iconSize: is30,
                            icon: const Icon(
                                Icons.notifications_active_rounded,
                                color: Colors.white
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(p10, 0, 0, 0),
                          child: GestureDetector(
                              onTap: () => {},
                              child: const ClipOval(
                                child: Image(
                                  image: AssetImage('assets/images/Omar.jpg'),
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
              margin: const EdgeInsets.all(m20),
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
                    padding: const EdgeInsets.symmetric(vertical: p10),
                    child: Text(
                        getTotalBalance(),
                        style: const TextStyle(
                          fontSize: fs34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                    ),
                  )
                ],
              ),
            ),
            if(widget.expand && widget.option) Container(
              margin: const EdgeInsets.all(m20),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('Update', style: TextStyle(color: Colors.white, fontSize: fs16)),
                      Container(
                        margin: const EdgeInsets.all(m10),
                        padding: const EdgeInsets.all(p5),
                        decoration: const BoxDecoration(
                          color: Color(primaryColor),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () => {},
                            iconSize: is30,
                            icon: const Icon(
                                Icons.ac_unit_outlined,
                                color: Colors.white
                            )
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Add card', style: TextStyle(color: Colors.white, fontSize: fs16)),
                      Container(
                        margin: const EdgeInsets.all(m10),
                        decoration: const BoxDecoration(
                          color: Colors.white12,
                          shape: BoxShape.circle,
                        ),
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          color: Colors.white,
                          dashPattern: const [6, 6],
                          strokeWidth: 2,
                          strokeCap: StrokeCap.round,
                          child: IconButton(
                              onPressed: () => {},
                              iconSize: is34,
                              icon: const Icon(
                                  Icons.add,
                                  color: Colors.white
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Info', style: TextStyle(color: Colors.white, fontSize: fs16)),
                      Container(
                        margin: const EdgeInsets.all(m5),
                        padding: const EdgeInsets.all(p5),
                        decoration: const BoxDecoration(
                          color: Color(primaryColor),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () => {},
                            iconSize: is30,
                            icon: const Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white
                            )
                        ),
                      )
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
