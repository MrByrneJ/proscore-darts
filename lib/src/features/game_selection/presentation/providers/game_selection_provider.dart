import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../router/router.dart';
import '../../../account/doman/entities/app_user.dart';
import '../../../account/presentation/providers/app_user_provider.dart';
import '../../../game_scoring/domain/entities/bobs.dart';
import '../../../game_scoring/domain/entities/atc.dart';
import '../../../game_scoring/domain/entities/cricket.dart';
import '../../../game_scoring/domain/entities/darts_match.dart';
import '../../../game_scoring/domain/entities/x01.dart';
import '../../../welcome/presentation/screens/welcome_screen.dart';
import '../../domain/usecases/selection_screen_event.dart';
import '../screens/add_player_screen.dart';
import '../screens/player_settings_screen.dart';
import '../screens/starting_score_screen.dart';

class ToggleState extends StateNotifier<bool> {
  ToggleState() : super(false);

  void toggle(bool value) => state = value;
}

final selectionScreenProvider =
    StateNotifierProvider<SelectionScreenServices, DartsMatch>(
        (ref) => SelectionScreenServices(ref));

class SelectionScreenServices extends StateNotifier<DartsMatch> {
  SelectionScreenServices(this.ref)
      : super(X01(
            matchId: const Uuid().v1(),
            dateTime: DateTime.now(),
            doubleIn: false,
            doubleOut: true,
            players: const [],
            firstTo: 5,
            playSets: false,
            sets: const [],
            startingScore: 501));
  final Ref ref;
  void handleEvent(SelectionScreenEvent event) async {
    if (ref.read(appUserProvider).id.isEmpty) router.go(WelcomeScreen.path);
    final user = ref.read(appUserProvider);
    event.map(
        playX01: (PlayX01 x01) {
          state = X01(
              matchId: const Uuid().v1(),
              dateTime: DateTime.now(),
              doubleIn: false,
              doubleOut: true,
              firstTo: 5,
              playSets: false,
              players: [
                Player(playerId: user.id, displayName: user.displayName)
              ],
              sets: [
                DartsSet(setIndex: 1, startingPlayerIndex: 0, legs: [
                  DartsLeg(legIndex: 1, throws: [
                    DartThrow(
                        throwIndex: 1,
                        player: Player(
                            playerId: user.id, displayName: user.displayName),
                        numberOfDartsThrown: 0)
                  ])
                ])
              ],
              startingScore: 501);
          router
              .push(StartingScoreScreen.path)
              .whenComplete(() => ref.invalidate(selectionScreenProvider));
        },
        playCricket: (PlayCricket playCricket) {
          state = Cricket(
            matchId: const Uuid().v1(),
            dateTime: DateTime.now(),
            cricketNumbers: const [
              {20: 0, 19: 0, 18: 0, 17: 0, 16: 0, 15: 0, 25: 0}
            ],
            firstTo: 5,
            players: [Player(playerId: user.id, displayName: user.displayName)],
            sets: [
              DartsSet(setIndex: 1, startingPlayerIndex: 0, legs: [
                DartsLeg(legIndex: 1, throws: [
                  DartThrow(
                      throwIndex: 1,
                      player: Player(
                          playerId: user.id, displayName: user.displayName),
                      numberOfDartsThrown: 0)
                ])
              ])
            ],
          );
          router
              .push(PlayerSettingsScreen.path)
              .whenComplete(() => ref.invalidate(selectionScreenProvider));
        },
        playClock: (PlayClock playClock) {
          state = ATC(
            matchId: const Uuid().v1(),
            dateTime: DateTime.now(),
            targetNumbers: const [1],
            players: [Player(playerId: user.id, displayName: user.displayName)],
            sets: [
              DartsSet(setIndex: 1, startingPlayerIndex: 0, legs: [
                DartsLeg(legIndex: 1, throws: [
                  DartThrow(
                      throwIndex: 1,
                      player: Player(
                          playerId: user.id, displayName: user.displayName),
                      numberOfDartsThrown: 0)
                ])
              ])
            ],
          );
          router
              .push(PlayerSettingsScreen.path)
              .whenComplete(() => ref.invalidate(selectionScreenProvider));
        },
        playBobs: (PlayBobs playBobs) {
          state = Bobs(
              matchId: const Uuid().v1(),
              dateTime: DateTime.now(),
              targetNumbers: const [1],
              allowNegativeNumbers: false,
              players: [
                Player(playerId: user.id, displayName: user.displayName)
              ],
              sets: [
                DartsSet(setIndex: 1, startingPlayerIndex: 0, legs: [
                  DartsLeg(legIndex: 1, throws: [
                    DartThrow(
                        throwIndex: 1,
                        player: Player(
                            playerId: user.id, displayName: user.displayName),
                        numberOfDartsThrown: 0)
                  ])
                ])
              ]);
          router
              .push(PlayerSettingsScreen.path)
              .whenComplete(() => ref.invalidate(selectionScreenProvider));
        },
        updateStartingScore: (UpdateStartingScore selected) =>
            state = state.copyWith(newStartingScore: selected.startingScore),
        updateFirstTo: (updateFirstTo selected) =>
            state = state.copyWith(newFirstTo: selected.selected),
        updatePlaySets: (UpdatePlaySets selected) =>
            state = state.copyWith(newPlaySets: selected.selected),
        addPlayerSelected: (AddPlayerSelected value) {
          router.push(AddPlayerScreen.path);
        },
        reorderPlayers: (ReorderPlayers value) {
          int newIndex = value.newIndex;
          if (newIndex > value.oldIndex) newIndex -= 1;
          var newPlayers = [...state.players];
          Player player = newPlayers.removeAt(value.oldIndex);
          newPlayers.insert(newIndex, player);
          state = state.copyWith(newPlayers: newPlayers);
        },
        removePlayer: (RemovePlayer value) {
          var newPlayers = [...state.players];
          newPlayers.removeAt(value.selected);
          state = state.copyWith(newPlayers: newPlayers);
        },
        addPlayer: (AddPlayer value) {
          var newState =
              state.copyWith(newPlayers: [...state.players, value.player]);
          if (newState is Bobs) {
            newState = newState.copyWith(
                newTargetNumbers: [for (final _ in newState.players) 1]);
          }
          if (newState is ATC) {
            newState = newState.copyWith(
                newTargetNumbers: [for (final _ in newState.players) 1]);
          }
          if (newState is Cricket) {
            newState = newState.copyWith(newCricketNumbers: [
              for (var _ in newState.players)
                {20: 0, 19: 0, 18: 0, 17: 0, 16: 0, 15: 0, 25: 0}
            ]);
          }
          state = newState;
        });
  }
}
