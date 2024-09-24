import 'package:flutter/material.dart';
import 'package:proscore_darts/src/features/game_scoring/domain/entities/darts_match.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key, required this.match});
  final DartsMatch match;

  String getMatchName(int index) {
    switch (index) {
      case 0:
        return 'Bobs';
      case 1:
        return 'Clock';
      case 2:
        return 'Cricket';
      case 3:
        return '${match.startingScore}';
    }
    return 'Error';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(match.name),
          const SizedBox(width: 10),
          Text(
              '${match.dateTime.day}/${match.dateTime.month}/${match.dateTime.year} - ${match.dateTime.hour}:${match.dateTime.minute}'),
          const SizedBox(width: 10),
          Text(
              'First to: ${match.firstTo} ${match.playSets ? 'sets' : 'legs'}'),
          Row(children: [
            for (var player in match.players) Text('${player.displayName}, ')
          ]),
          Text('Winner: ${match.winningPlayer?.displayName ?? ''}'),
        ],
      ),
    );
  }
}
