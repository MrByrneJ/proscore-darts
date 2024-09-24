import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../providers/scoring_screen_provider.dart';
import 'scoring_inputs.dart';

class EndOfLegDialog extends ConsumerWidget {
  const EndOfLegDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);
    int dartsThrown =
        state.dartsMatch.sets.last.legs.last.throws.last.numberOfDartsThrown;
    String winnersName =
        state.dartsMatch.sets.last.legs.last.winningPlayer?.displayName ??
            'Error';
    bool playerWinsMatch = state.dartsMatch.winningPlayer != null;
    bool playerWinsSet = state.dartsMatch.sets.last.winningPlayer != null;

    String matchSetOrLeg = 'Leg';
    if (playerWinsSet) matchSetOrLeg = 'Set';
    if (playerWinsMatch) matchSetOrLeg = 'Match';
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Text(
            '$winnersName wins the $matchSetOrLeg',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        if (state.dartsMatch.sets.last.legs.last.throws.last.darts.isEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(
                          const ScoringScreenEvent.updateNumberOfDartsThrown(
                              1)),
                  width: 60,
                  lable: '1',
                  forgroundColor:
                      dartsThrown == 1 ? primaryWhite : secondaryWhite,
                  isSelected: dartsThrown == 1),
              const SizedBox(width: 5),
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(
                          const ScoringScreenEvent.updateNumberOfDartsThrown(
                              2)),
                  width: 60,
                  lable: '2',
                  forgroundColor:
                      dartsThrown == 2 ? primaryWhite : secondaryWhite,
                  isSelected: dartsThrown == 2),
              const SizedBox(width: 5),
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(
                          const ScoringScreenEvent.updateNumberOfDartsThrown(
                              3)),
                  width: 60,
                  lable: '3',
                  forgroundColor: dartsThrown == 3 || dartsThrown == 0
                      ? primaryWhite
                      : secondaryWhite,
                  isSelected: dartsThrown == 3 || dartsThrown == 0),
            ],
          ),
        if (state.dartsMatch.sets.last.legs.last.throws.last.darts.isEmpty)
          const SizedBox(height: 10),
        if (state.dartsMatch.sets.last.legs.last.throws.last.darts.isEmpty)
          const Text('How many darts were thrown?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => ref.read(scoringScreenProvider.notifier).undo(),
              child: const Text('Go Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(const ScoringScreenEvent.endLeg()),
              child: const Text('Done',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        )
      ],
    );
  }
}
