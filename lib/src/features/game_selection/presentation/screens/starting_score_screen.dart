import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/core/widgets/image_background_scaffold.dart';

import '../../../../router/router.dart';
import '../../domain/usecases/selection_screen_event.dart';
import '../providers/game_selection_provider.dart';
import '../widgets/game_setup_bar.dart';
import '../widgets/option.dart';
import 'player_settings_screen.dart';

class StartingScoreScreen extends ConsumerWidget {
  const StartingScoreScreen({super.key});

  static const path = '/starting-score-screen';
  void setStartingScore(int score, WidgetRef ref) => ref
      .read(selectionScreenProvider.notifier)
      .handleEvent(SelectionScreenEvent.updateStartingScore(score));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectionScreenProvider);
    return ImageBackgroundScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
                  child: Text('Select starting score',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Option(
                          onPressed: (selected) =>
                              setStartingScore(selected, ref),
                          option: 201,
                          isSelected: state.startingScore == 201),
                      Option(
                          onPressed: (selected) =>
                              setStartingScore(selected, ref),
                          option: 301,
                          isSelected: state.startingScore == 301),
                      Option(
                          onPressed: (selected) =>
                              setStartingScore(selected, ref),
                          option: 501,
                          isSelected: state.startingScore == 501),
                      Option(
                          onPressed: (selected) =>
                              setStartingScore(selected, ref),
                          option: 701,
                          isSelected: state.startingScore == 701),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GameSetupBar(
            onNextPressed: () => router
                .push(PlayerSettingsScreen.path), // Player Settings Screen
            backLable: 'Select Game',
            nextLable: 'Player Settings',
          ),
        ],
      ),
    );
  }
}
