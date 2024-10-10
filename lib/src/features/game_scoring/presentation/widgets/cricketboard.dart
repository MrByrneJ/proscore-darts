import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../domain/entities/cricket.dart';
import '../../domain/entities/darts_match.dart';
import '../../domain/scoring_screen_state.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../../presentation/widgets/score_box.dart';
import '../providers/scoring_screen_provider.dart';
import 'scoring_inputs.dart';

class Cricketboard extends ConsumerWidget {
  const Cricketboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);
    state.dartsMatch.getChalks(0);

    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 7.5),
      color: darkShadowColor,
      height: double.infinity,
      child: Row(
        children: [
          for (var i = 0; i < state.dartsMatch.players.length; i++)
            if (state.dartsMatch.players.length == 1) const ScoreBar(),
          PlayerBar(state: state, index: 0),
          if (state.dartsMatch.players.length > 1) const ScoreBar(),
          if (state.dartsMatch.players.length > 1)
            PlayerBar(state: state, index: 1),
          if (state.dartsMatch.players.length != 2) const ScoreBar(),
          if (state.dartsMatch.players.length == 3)
            PlayerBar(state: state, index: 2),
        ],
      ),
    );
  }
}

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key, required this.state, required this.index});
  final ScoringScreenState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    final match = state.dartsMatch as Cricket;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScoreBox(
                state: state,
                foregroundColor: index == state.getTurn(state.dartsMatch)
                    ? primaryGreen
                    : primaryWhite,
                index: index),
            for (var i = 0; i < match.getChalks(index).length; i++)
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                      width: scoreBoxHeight,
                      height: scoreBoxHeight,
                      child: Center(
                          child: Text(
                        match.getChalks(index)[i].lable,
                        style: TextStyle(
                          fontSize: 30,
                          color: index == state.getTurn(state.dartsMatch)
                              ? primaryGreen
                              : primaryWhite,
                        ),
                      ))),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ScoreBar extends ConsumerWidget {
  const ScoreBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);
    var match = state.dartsMatch;
    final darts = match.sets.last.legs.last.throws.last.darts;
    List<String> cricketNumbers = [];
    if (match is Cricket) {
      match.cricketNumbers[0].forEach((key, value) => cricketNumbers.add(key));
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ChalkboardHeader(),
            for (var target in cricketNumbers)
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(ScoringScreenEvent.throwDart(
                        Dart(
                            dartIndex: darts.length + 1,
                            section: int.tryParse(target) ?? 0,
                            multiplier: 1),
                      )),
                  lable: target,
                  width: 60,
                  height: 60),
          ],
        ),
      ),
    );
  }
}
