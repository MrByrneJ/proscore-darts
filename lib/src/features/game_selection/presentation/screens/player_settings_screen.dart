import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant_variables.dart';
import '../../../../core/widgets/image_background_scaffold.dart';
import '../../../../router/router.dart';
import '../../../game_scoring/domain/entities/atc.dart';
import '../../../game_scoring/domain/entities/x01.dart';
import '../../../game_scoring/domain/usecases/scoring_screen_event.dart';
import '../../../game_scoring/presentation/providers/scoring_screen_provider.dart';
import '../../domain/usecases/selection_screen_event.dart';
import '../providers/game_selection_provider.dart';
import '../widgets/game_setup_bar.dart';
import '../widgets/player_avatar.dart';
import 'match_settings_screen.dart';

class PlayerSettingsScreen extends ConsumerWidget {
  const PlayerSettingsScreen({super.key});

  static const path = '/player-settings-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectionScreenProvider);
    return ImageBackgroundScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: primaryWhite,
              ),
              SizedBox(width: 5),
              Text(
                'Drag Players Into Play Order',
                style: TextStyle(fontSize: 12, color: primaryWhite),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: ReorderableListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      proxyDecorator: (child, index, animation) => PlayerAvatar(
                          key: const ValueKey('proxy'),
                          isSelected: true,
                          player: state.players[index]),
                      onReorder: (oldIndex, newIndex) => ref
                          .read(selectionScreenProvider.notifier)
                          .handleEvent(SelectionScreenEvent.reorderPlayers(
                              oldIndex: oldIndex, newIndex: newIndex)),
                      children: [
                        for (var i = 0; i < state.players.length; i++)
                          ReorderableDragStartListener(
                            key: ValueKey(state.players[i].playerId),
                            index: i,
                            child: PlayerAvatar(
                                onTapped: () => ref
                                    .read(selectionScreenProvider.notifier)
                                    .handleEvent(
                                        SelectionScreenEvent.removePlayer(i)),
                                actionIcon: const Icon(
                                  Icons.cancel,
                                  color: primaryRed,
                                ),
                                player: state.players[i]),
                          ),
                        if (state.players.length < 3)
                          Padding(
                            key: const Key('AddButtonKey'),
                            padding: const EdgeInsets.only(bottom: 30),
                            child: IconButton(
                                onPressed: () => ref
                                    .read(selectionScreenProvider.notifier)
                                    .handleEvent(const SelectionScreenEvent
                                        .addPlayerSelected()),
                                icon: const Icon(Icons.add_box_outlined,
                                    size: 40, color: primaryGreen)),
                          ),
                      ]),
                )),
          ),
          GameSetupBar(
            key: const ValueKey('playerSettingsSetUpBar'),
            onNextPressed: () => state is X01
                ? router.push(MatchSettingsScreen.path)
                : ref
                    .read(scoringScreenProvider.notifier)
                    .handleEvent(ScoringScreenEvent.startGame(state)),
            backLable: state is X01 ? 'Starting Score' : 'Select Game',
            nextLable: state is ATC ? 'Play ATC' : 'Match Settings',
          ),
        ],
      ),
    );
  }
}
