import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../Models/card.dart';
import '../../../Services/database.dart';
import '../../../Widgets/purchased_row_button.dart';
import 'transaction_details.dart';

class HistoryTransactions extends StatefulWidget {
  final String? cid;

  const HistoryTransactions({Key? key, this.cid}) : super(key: key);

  @override
  State<HistoryTransactions> createState() => _HistoryTransactionsState();
}

class _HistoryTransactionsState extends State<HistoryTransactions> {
  List<Transaction> transactionsData = [];
  List<Transaction> filteredTransactions = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        90;

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
          if (widget.cid != null) {
            filteredTransactions = transactionsData.where((transaction) {
              return transaction.paid
                  .any((payment) => payment.cid == widget.cid);
            }).toList();
          } else {
            filteredTransactions = transactionsData
                .where((transaction) => transaction.uid == user.uid)
                .toList();
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text("History Transactions"),
          centerTitle: true,
          backgroundColor: const Color(secondaryColor)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: screenHeight,
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
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransactionDetails(
                                      transaction:
                                          filteredTransactions[index])))
                        },
                        shortName: false,
                      );
                    },
                  )
                : const Center(
                    child: Text('No Transactions'),
                  ),
          ),
        ),
      ),
    );
  }
}
