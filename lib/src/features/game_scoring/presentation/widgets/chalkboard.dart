import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../providers/scoring_screen_provider.dart';
import 'score_box.dart';

class Chalkboard extends ConsumerWidget {
  const Chalkboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);

    return Container(
      alignment: Alignment.topCenter,
      color: darkShadowColor,
      height: double.infinity,
      child: Column(
        children: [
          Row(children: [
            for (var i = 0; i < state.dartsMatch.players.length; i++)
              ScoreBox(
                  state: state,
                  foregroundColor: i == state.getTurn(state.dartsMatch)
                      ? primaryGreen
                      : primaryWhite,
                  index: i)
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < state.dartsMatch.players.length; i++)
                Flexible(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      state.dartsMatch.getChalks(i)[index].lable,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: i == state.getTurn(state.dartsMatch)
                            ? primaryGreen
                            : primaryWhite,
                      ),
                    ),
                    itemCount: state.dartsMatch.getChalks(i).length,
                    shrinkWrap: true,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
