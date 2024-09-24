import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/enums.dart';
import '../../domain/entities/darts_match.dart';
import '../../domain/scoring_screen_state.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../providers/scoring_screen_provider.dart';
import 'scoring_inputs.dart';

class Field extends ConsumerWidget {
  const Field({super.key, required this.state});

  final ScoringScreenState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scoringScreenProvider);
    final darts = state.dartsMatch.sets.last.legs.last.throws.last.darts;
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Column(
        children: [
          Row(
            children: [
              InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(const ScoringScreenEvent.selectMultiplier(
                        SelectedMultiplier.single)),
                lable: 'Single',
                forgroundColor:
                    state.selectedMultiplier == SelectedMultiplier.single
                        ? primaryWhite
                        : secondaryWhite,
                isSelected:
                    state.selectedMultiplier == SelectedMultiplier.single,
              ),
              InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(const ScoringScreenEvent.selectMultiplier(
                        SelectedMultiplier.double)),
                lable: 'Double',
                forgroundColor:
                    state.selectedMultiplier == SelectedMultiplier.double
                        ? primaryWhite
                        : secondaryWhite,
                isSelected:
                    state.selectedMultiplier == SelectedMultiplier.double,
              ),
              InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(const ScoringScreenEvent.selectMultiplier(
                        SelectedMultiplier.treble)),
                lable: 'Treble',
                forgroundColor:
                    state.selectedMultiplier == SelectedMultiplier.treble
                        ? primaryWhite
                        : secondaryWhite,
                isSelected:
                    state.selectedMultiplier == SelectedMultiplier.treble,
              ),
            ],
          ),
          for (var r = 0; r < 4; r++)
            Row(
              children: [
                for (var i = 0; i < 5; i++)
                  InputButton(
                      whenTapped: () => ref
                          .read(scoringScreenProvider.notifier)
                          .handleEvent(ScoringScreenEvent.throwDart(Dart(
                              dartIndex: darts.length + 1,
                              section: i + 1 + (r * 5),
                              multiplier: state.getMultiple))),
                      forgroundColor: secondaryWhite,
                      lable: '${i + 1 + (r * 5)}')
              ],
            ),
          Row(
            children: [
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(ScoringScreenEvent.throwDart(Dart(
                          dartIndex: darts.length + 1,
                          section: 25,
                          multiplier: 1))),
                  lable: '25'),
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(ScoringScreenEvent.throwDart(Dart(
                          dartIndex: darts.length + 1,
                          section: 25,
                          multiplier: 2))),
                  lable: 'Bull'),
              InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(ScoringScreenEvent.throwDart(Dart(
                          dartIndex: darts.length + 1,
                          section: 0,
                          multiplier: 1))),
                  lable: 'Miss'),
            ],
          ),
        ],
      ),
    );
  }
}
