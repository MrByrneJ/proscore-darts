import 'package:flutter/material.dart';

import '../../../../core/constant_variables.dart';

class Option extends StatelessWidget {
  const Option(
      {super.key,
      required this.onPressed,
      required this.option,
      required this.isSelected});

  final ValueChanged onPressed;
  final int option;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
                onTap: () => onPressed(option),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? primaryGreen : primaryGrey,
                    ),
                    height: 50,
                    child: Center(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '$option',
                              maxLines: 1,
                              style: const TextStyle(color: primaryWhite),
                            )))))));
  }
}
