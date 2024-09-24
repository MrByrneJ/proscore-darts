import 'package:flutter/material.dart';

import '../../../../core/constant_variables.dart';
import '../../../account/doman/entities/app_user.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar(
      {super.key,
      this.onTapped,
      this.actionIcon,
      required this.player,
      this.isSelected = false});
  final VoidCallback? onTapped;
  final Icon? actionIcon;
  final Player? player;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Card(
                color: secondaryWhite,
                elevation: isSelected ? 0 : 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: darkShadowColor),
                        width: 20,
                        height: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100)),
                          color: darkShadowColor,
                        ),
                        width: 30,
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (actionIcon != null)
              Positioned(
                  top: 0,
                  right: 10,
                  child: GestureDetector(
                      onTap: onTapped,
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: primaryBlack),
                          child: actionIcon)))
          ],
        ),
        if (player != null)
          Text(player?.displayName ?? '',
              style: const TextStyle(fontSize: 16, color: primaryWhite)),
      ],
    );
  }
}
