import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:o_card/Screens/Main/Other/history_statistics.dart';
import 'package:o_card/Screens/Main/Other/history_transactions.dart';
import 'package:o_card/Widgets/purchased_row_button.dart';
import 'package:provider/provider.dart';
import '../Models/card.dart';
import '../Services/database.dart';
import '../Services/utils.dart';

class SummarizedContainer extends StatefulWidget {
  final String headerText;
  final String footerText;

  const SummarizedContainer(
      {Key? key, required this.headerText, required this.footerText})
      : super(key: key);

  @override
  State<SummarizedContainer> createState() => _SummarizedContainerState();
}

class _SummarizedContainerState extends State<SummarizedContainer> {
  List<Transaction> transactionsData = [];
  List<Transaction> filteredTransactions = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      DatabaseService(uid: user.uid).transactionsRef.onValue.listen((event) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        late List<Transaction> formatData = [];

        if (data != null) {
          final Map<String, dynamic> convertedData =
              Map<String, dynamic>.from(data);

          convertedData.forEach((key, value) {
            final Map<String, dynamic> convertedCard =
                Map<String, dynamic>.from(value);
            formatData.add(Transaction.fromMap(convertedCard));
          });

          setState(() {
            transactionsData = formatData;
          });
        }
      });

      if (transactionsData.isNotEmpty) {
        setState(() {
          filteredTransactions = cutList(transactionsData
              .where((transaction) => transaction.uid == user.uid)
              .toList());
        });
      }
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black26),
              ),
            ),
            child: Text(
              widget.headerText,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 350,
              child: filteredTransactions.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: filteredTransactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PurchasedRowButton(
                          name: filteredTransactions[index].name,
                          more: filteredTransactions[index].category,
                          cost: filteredTransactions[index].amount,
                          image: filteredTransactions[index].image,
                          underline: true,
                          shortName: false,
                          onPressed: () => {},
                        );
                      },
                    )
                  : const Center(
                      child: Text('No Transactions'),
                    )),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.black26),
              ),
            ),
            child: GestureDetector(
              onTap: () => {
                widget.footerText.contains('transactions')
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryTransactions()))
                    : widget.footerText.contains('statistics')
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HistoryStatistics()))
                        : null
              },
              child: Text(
                widget.footerText,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
