import 'package:flutter/material.dart';
import '../constants.dart';
import '../Services/utils.dart';

class PurchasedRowButton extends StatelessWidget {
  final String name;
  final String more;
  final double cost;
  final String image;
  final bool underline;
  final bool shortName;
  final VoidCallback onPressed;

  const PurchasedRowButton(
      {
        Key? key,
        required this.name,
        required this.more,
        required this.cost,
        required this.image,
        required this.underline,
        required this.onPressed,
        required this.shortName
      }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.fromLTRB(0, 0, 0, underline ? 10.0 : 0),
        decoration: BoxDecoration(
          border:  underline ? const Border(
            bottom: BorderSide(width:1.0, color: Colors.black12),
          ) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(seaBlue).withOpacity(0.65),
                    shape: BoxShape.circle,
                  ),
                  child: shortName ?  Text(
                      image,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(secondaryColor),
                        fontSize: 16
                      )
                    ) : Image(
                    image: AssetImage('assets/images/BrandsLogos/$image'),
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      more,
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '-${getTotalBalance(cost)}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
