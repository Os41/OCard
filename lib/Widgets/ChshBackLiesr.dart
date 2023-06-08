import 'package:flutter/material.dart';

class CashBackList extends StatelessWidget {
  const CashBackList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = [
      CashBackListItem(
        logo: 'assets/images/logo/logo.png',
        description: 'Item 1',
        price: 10.99,
      ),
      CashBackListItem(
        logo: 'assets/images/logo/logo.png',
        description: 'Item 2',
        price: 15.99,
      ),
      CashBackListItem(
        logo: 'assets/images/logo/logo.png',
        description: 'Item 3',
        price: 19.99,
      ),
      CashBackListItem(
        logo: 'assets/images/logo/logo.png',
        description: 'Item 4',
        price: 19.99,
      ),
      CashBackListItem(
        logo: 'assets/images/logo/logo.png',
        description: 'Item 5',
        price: 19.99,
      ),
    ];

    return ListView.separated(
      itemCount: itemList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
      ),
      itemBuilder: (context, index) {
        final item = itemList[index];
        return ListTile(
          leading: Image.asset(item.logo),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.description),
              Text('\$${item.price.toStringAsFixed(2)}'),
            ],
          ),
        );
      },
    );
  }
}

class CashBackListItem {
  final String logo;
  final String description;
  final double price;

  CashBackListItem({
    required this.logo,
    required this.description,
    required this.price,
  });
}