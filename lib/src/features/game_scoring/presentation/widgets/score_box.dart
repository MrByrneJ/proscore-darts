import 'package:flutter/material.dart';

import '../../../../core/constant_variables.dart';
import '../../domain/scoring_screen_state.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox(
      {super.key,
      required this.foregroundColor,
      required this.state,
      required this.index});

  final ScoringScreenState state;
  final int index;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final player = state.dartsMatch.players[index];

    return ChalkboardHeader(
      children: [
        if (state.dartsMatch.playSets)
          Flexible(
            flex: 3,
            child: FittedBox(
              child: Text(
                  'Sets:  ${state.dartsMatch.getSetWins(player.playerId)}, Legs: ${state.dartsMatch.getLegWins(player.playerId)}',
                  maxLines: 1,
                  style: TextStyle(color: foregroundColor)),
            ),
          ),
        Flexible(
          flex: 4,
          child: FittedBox(
            child: Text(
                '${player.displayName}${state.dartsMatch.playSets ? '' : ' (${state.dartsMatch.getLegWins(player.playerId)})'}',
                maxLines: 1,
                style: TextStyle(color: foregroundColor)),
          ),
        ),
        Flexible(
          flex: 5,
          child: FittedBox(
            child: Text(
              '${state.dartsMatch.getScore(index)}',
              maxLines: 1,
              style: TextStyle(fontSize: 28, color: foregroundColor),
            ),
          ),
        )
      ],
    );
  }
}

class ChalkboardHeader extends StatelessWidget {
  const ChalkboardHeader({super.key, this.children});

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Container(
            width: double.infinity,
            height: scoreBoxHeight,
            color: Colors.transparent,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [...children ?? []],
            )));
  }
}
