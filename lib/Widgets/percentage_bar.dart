import 'package:flutter/material.dart';
import '../Models/percentage.dart';
import '../constants.dart';
import '../Services/utils.dart';

class PercentageBar extends StatelessWidget {
  final List<Percentage>? percentageList;
  final List? controllerList;
  const PercentageBar({Key? key, this.percentageList, this.controllerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var percentageBarList = percentageList != null ? calculateValues(percentageList) : calculateValuesController(controllerList);
    List? checkList = percentageList ?? controllerList;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
          child: Text('0', style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 270,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(secondaryColor).withOpacity(0.3), // Default color for the container
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (checkList!.isNotEmpty) Container(
                  width: percentageBarList[0],
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: checkList.length > 1 ? const BorderRadius.horizontal(left: Radius.circular(8)) : const BorderRadius.all(Radius.circular(8)),
                    color: const Color(purple),
                  )
              ),
              if (checkList.length >= 3) Container(
                width: percentageBarList[2],
                height: 20,
                color: const Color(hGreen),
              ),
              if (checkList.length == 4) Container(
                width: percentageBarList[3],
                height: 20,
                color: const Color(bOrange),
              ),
              if (checkList.length >= 2) Container(
                  width: percentageBarList[1],
                  height: 20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
                    color: Color(pBlue),
                  )
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
          child: Text('100', style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),),
        ),
      ],
    );
  }
}
