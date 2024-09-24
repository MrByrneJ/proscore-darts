import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../domain/scoring_screen_state.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../providers/scoring_screen_provider.dart';
import 'scoring_inputs.dart';

class Keypad extends ConsumerWidget {
  const Keypad({super.key, required this.state});

  final ScoringScreenState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(const ScoringScreenEvent.submitScored(60)),
                forgroundColor: secondaryGreen,
                lable: '60'),
            InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(const ScoringScreenEvent.submitScored(100)),
                forgroundColor: secondaryGreen,
                lable: '100'),
            InputButton(
              whenTapped: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(const ScoringScreenEvent.submitScored(180)),
              forgroundColor: secondaryGreen,
              lable: '180',
            )
          ],
        ),
        for (var r = 0; r < 3; r++)
          Row(
            children: [
              for (var i = 0; i < 3; i++)
                InputButton(
                  whenTapped: () => ref
                      .read(scoringScreenProvider.notifier)
                      .handleEvent(ScoringScreenEvent.inputIndicatedScore(
                          '${state.indicatedScore}${i + 1 + (r * 3)}')),
                  lable: '${i + 1 + (r * 3)}',
                  errorColor:
                      int.parse('${state.indicatedScore}${i + 1 + (r * 3)}') >
                              180
                          ? primaryRed
                          : null,
                )
            ],
          ),
        Row(
          children: [
            InputButton(
                whenTapped: () {
                  var indicated = state.indicatedScore.toString();
                  indicated = indicated.length == 1
                      ? '0'
                      : indicated.substring(0, indicated.length - 1);
                  return ref.read(scoringScreenProvider.notifier).handleEvent(
                      ScoringScreenEvent.inputIndicatedScore(indicated));
                },
                lable: '\u232B'),
            InputButton(
              whenTapped: () => ref
                  .read(scoringScreenProvider.notifier)
                  .handleEvent(ScoringScreenEvent.inputIndicatedScore(
                      '${state.indicatedScore}0')),
              lable: '0',
              errorColor: int.parse('${state.indicatedScore}0') > 180
                  ? primaryRed
                  : null,
            ),
            InputButton(
                whenTapped: () => ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(
                        ScoringScreenEvent.submitScored(state.indicatedScore)),
                lable: '\u2713'),
          ],
        ),
      ],
    );
  }
}
