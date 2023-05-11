import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(width: double.infinity, height: 200, color: Colors.amber,),
        Container(width: double.infinity, height: 200, color: Colors.blue,),
      ],
    );
  }
}
