import 'package:flutter/material.dart';

import '../../../account/doman/entities/app_user.dart';
import 'player_avatar.dart';
import 'stats_tile.dart';

class PlayerStatsCard extends StatelessWidget {
  const PlayerStatsCard(
      {super.key, required this.user, this.whenActionTapped, this.actionIcon});
  final AppUser user;
  final VoidCallback? whenActionTapped;
  final Icon? actionIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayerAvatar(
                player:
                    Player(playerId: user.id, displayName: user.displayName),
                onTapped: whenActionTapped,
                actionIcon: actionIcon),
            const Flexible(
                flex: 1, child: StatsTile(lable: 'Average', stat: '30.6')),
            const Flexible(
                flex: 1, child: StatsTile(lable: 'First 9', stat: '34.0')),
            const Flexible(
                flex: 1, child: StatsTile(lable: 'Checkout', stat: '22.2%')),
          ],
        ),
      ),
    );
  }
}
