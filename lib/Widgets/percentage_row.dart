import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class PercentageRow extends StatefulWidget {
  final String cardNumber;
  final String nickname;
  final bool isEdit;
  final String initialValue;
  final TextEditingController? controller;
  final int color;
  final bool? isAdd;
  final dynamic onPressed;

  const PercentageRow(
      {Key? key,
        required this.cardNumber,
        required this.nickname,
        required this.isEdit,
        required this.initialValue,
        this.controller,
        required this.color,
        this.isAdd,
        required this.onPressed,
      })
      : super(key: key);

  @override
  State<PercentageRow> createState() => _PercentageRowState();
}

class _PercentageRowState extends State<PercentageRow> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (widget.isEdit) Container(
            decoration: const BoxDecoration(
              color: Color(hRed),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: widget.onPressed,
              iconSize: 30,
              color: Colors.white,
              icon: const Icon(Icons.remove_rounded),
            ),
          ) else Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(widget.color),
              shape: BoxShape.circle,
            ),
            child: Text(
                widget.nickname,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16
                )
            ),
          ),
          Text(
              widget.cardNumber,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(secondaryColor),
                  fontSize: 16
              )
          ),
          widget.isEdit && widget.initialValue.isNotEmpty ?
          Container(
            width: 70,
            height: 90,
            alignment: Alignment.center,
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}$')),
              ],
            ),
          ) : widget.isAdd != null ?
                IconButton(
                  onPressed: widget.onPressed,
                  iconSize: 30,
                  color: const Color(pBlue),
                  icon: const Icon(Icons.add_circle_outline_rounded),
                )
            : Text(
              widget.initialValue,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(secondaryColor),
                  fontSize: 18
              )
          )
        ],
      ),
    );
  }
}
