import 'package:flutter/material.dart';

import '../../../../core/constant_variables.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    this.whenTapped,
    required this.icon,
    this.isActive = true,
    this.isSelected = false,
  });
  final VoidCallback? whenTapped;
  final IconData icon;
  final bool isActive;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenTapped,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            color: isSelected ? highlightColor : Colors.transparent,
            elevation: 3,
            shadowColor: isSelected ? null : Colors.transparent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Icon(icon, color: isActive ? primaryWhite : inactiveColor),
            )),
      ),
    );
  }
}
