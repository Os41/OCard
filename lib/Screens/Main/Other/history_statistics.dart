import 'package:flutter/material.dart';
import '../../../constants.dart';

class HistoryStatistics extends StatefulWidget {
  const HistoryStatistics({Key? key}) : super(key: key);

  @override
  State<HistoryStatistics> createState() => _HistoryStatisticsState();
}

class _HistoryStatisticsState extends State<HistoryStatistics> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("History Statistics"),
          centerTitle: true,
          backgroundColor: const Color(secondaryColor)
      ),
      body: const SingleChildScrollView(

      ),
    );
  }
}