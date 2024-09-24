import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/widgets/image_background_scaffold.dart';
import '../../../game_scoring/domain/entities/x01.dart';
import '../../../game_scoring/domain/usecases/scoring_screen_event.dart';
import '../../../game_scoring/presentation/providers/scoring_screen_provider.dart';
import '../../domain/usecases/selection_screen_event.dart';
import '../providers/game_selection_provider.dart';
import '../widgets/game_setup_bar.dart';
import '../widgets/option.dart';

class MatchSettingsScreen extends ConsumerWidget {
  const MatchSettingsScreen({super.key});

  static const path = '/match-settings-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectionScreenProvider);

    return ImageBackgroundScaffold(
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Select first to',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Option(
                          onPressed: (selected) => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  SelectionScreenEvent.updateFirstTo(selected)),
                          option: 1,
                          isSelected: state.firstTo == 1),
                      Option(
                          onPressed: (selected) => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  SelectionScreenEvent.updateFirstTo(selected)),
                          option: 3,
                          isSelected: state.firstTo == 3),
                      Option(
                          onPressed: (selected) => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  SelectionScreenEvent.updateFirstTo(selected)),
                          option: 5,
                          isSelected: state.firstTo == 5),
                      Option(
                          onPressed: (selected) => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  SelectionScreenEvent.updateFirstTo(selected)),
                          option: 7,
                          isSelected: state.firstTo == 7),
                      Option(
                          onPressed: (selected) => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  SelectionScreenEvent.updateFirstTo(selected)),
                          option: 9,
                          isSelected: state.firstTo == 9),
                    ],
                  ),
                ),
                if (state is X01)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SetsButton(
                          whenTapped: () => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  const SelectionScreenEvent.updatePlaySets(
                                      false)),
                          isSelected: !state.playSets,
                          lable: 'Legs'),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: FittedBox(
                            child: Switch(
                              onChanged: (value) => ref
                                  .read(selectionScreenProvider.notifier)
                                  .handleEvent(
                                      SelectionScreenEvent.updatePlaySets(
                                          value)),
                              value: state.playSets,
                              activeColor: primaryGreen,
                              inactiveThumbColor: primaryGreen,
                              trackColor:
                                  const WidgetStatePropertyAll(primaryWhite),
                              trackOutlineColor:
                                  const WidgetStatePropertyAll(primaryGreen),
                              thumbIcon: const WidgetStatePropertyAll(Icon(
                                Icons.circle,
                                color: primaryGreen,
                              )),
                            ),
                          ),
                        ),
                      ),
                      SetsButton(
                          whenTapped: () => ref
                              .read(selectionScreenProvider.notifier)
                              .handleEvent(
                                  const SelectionScreenEvent.updatePlaySets(
                                      true)),
                          isSelected: state.playSets,
                          lable: 'Sets'),
                    ],
                  ),
              ],
            ),
          ),
          GameSetupBar(
            onNextPressed: () => ref
                .read(scoringScreenProvider.notifier)
                .handleEvent(ScoringScreenEvent.startGame(state)),
            backLable: 'Player Settings',
            nextLable: 'Play Darts',
          ),
        ],
      ),
    );
  }
}

class SetsButton extends StatelessWidget {
  const SetsButton({
    super.key,
    required this.isSelected,
    required this.whenTapped,
    required this.lable,
  });
  final bool isSelected;
  final VoidCallback whenTapped;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: isSelected ? primaryGreen : primaryGrey),
        ),
      ),
    );
  }
}
