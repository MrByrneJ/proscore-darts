import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscore_darts/src/features/account/doman/usecases/user_services_event.dart';

import '../../../../core/enums.dart';
import '../../../../router/router.dart';
import '../../../account/presentation/providers/app_user_provider.dart';
import '../../../game_selection/presentation/screens/game_selection_screen.dart';
import '../../domain/entities/bobs.dart';
import '../../domain/entities/atc.dart';
import '../../domain/entities/cricket.dart';
import '../../domain/scoring_screen_state.dart';
import '../../domain/usecases/scoring_screen_event.dart';
import '../screens/scoring_screen.dart';

class ToggleState extends StateNotifier<bool> {
  ToggleState() : super(false);

  void toggle(bool value) => state = value;
}

final scoringScreenProvider =
    StateNotifierProvider<ScoringScreenServices, ScoringScreenState>(
        (ref) => ScoringScreenServices(ref));

class ScoringScreenServices extends StateNotifier<ScoringScreenState> {
  ScoringScreenServices(this.ref) : super(ScoringScreenState.initial());
  final Ref ref;
  List<ScoringScreenState> gameProgress = [ScoringScreenState.initial()];

  bool _processingGameDate = false;
  int currentIndex = 0;

  void undo() {
    currentIndex == 0 ? null : currentIndex -= 1;
    state = gameProgress[currentIndex];
  }

  void redo() {
    currentIndex == gameProgress.length - 1 ? null : currentIndex += 1;
    state = gameProgress[currentIndex];
  }

  void trimGameProgress() =>
      gameProgress.removeRange(currentIndex + 1, gameProgress.length);

  void handleEvent(ScoringScreenEvent event) async {
    if (_processingGameDate) return;
    event.map(
        selectMatch: (SelectMatch selected) =>
            state = state.updateMatch(selected.match),
        selectInputMethod: (SelectInputMethod selected) =>
            state = state.updateSelectedInputMethod(selected.method),
        selectMultiplier: (SelectMultiplier selected) =>
            state = state.updateSelectedMultiplier(selected.multiplier),
        inputIndicatedScore: (InputIndicatedScore number) =>
            state = state.inputIndicatedScore(number.keyed),
        throwDart: (ThrowDart thrown) async {
          _processingGameDate = true;
          trimGameProgress();
          state = state.throwDart(thrown.dartThrown,
              state.selectedInput != ScoringInputMethod.cricket);
          //  await Future.delayed(const Duration(seconds: 1));
          state = state.updateAfterThrow();
          gameProgress.add(state.update());
          currentIndex++;
          state = gameProgress.last;
          _processingGameDate = false;
        },
        submitScored: (SubmitScored score) {
          _processingGameDate = true;
          trimGameProgress();
          state = state.submitScored(score.keyed);
          gameProgress.add(state.update(changeTurn: true));
          currentIndex++;
          state = gameProgress.last;
          _processingGameDate = false;
        },
        updateNumberOfDartsThrown: (UpdateNumberOfDartsThrown darts) =>
            state = state.updateNumberOfDartsThrown(darts.num),
        endLeg: (EndLeg input) {
          final user = ref.read(appUserProvider);

          if (state.dartsMatch.winningPlayer != null) {
            if (user.id.isEmpty) {
              final newUserDetails =
                  user.updateMatchHistory(newMatch: state.dartsMatch);
              ref.read(appUserProvider.notifier).handleEvent(
                  UserServicesEvent.updateUserDetails(newUserDetails));
            }
            router.go(GameSelectionScreen.path);
            return state = ScoringScreenState.initial();
          }
          if (state.dartsMatch.sets.last.winningPlayer != null) {
            var newMatch = state.dartsMatch.beginNewSet();
            return state = state.copyWith(
                newDartsMatch: newMatch,
                newDartsRemaining: 3,
                newIndicatedScore: 0,
                newIndicatedDarts: [],
                newShowEndOfLegDialog: false);
          }
          var newMatch = state.dartsMatch.beginNewLeg();
          return state = state.copyWith(
              newDartsMatch: newMatch,
              newDartsRemaining: 3,
              newIndicatedScore: 0,
              newIndicatedDarts: [],
              newShowEndOfLegDialog: false);
        },
        startGame: (StartGame value) {
          var newState = state.copyWith(newDartsMatch: value.newMatch);
          if (value.newMatch is Cricket) {
            newState = newState.copyWith(
                newInputs: [ScoringInputMethod.cricket],
                newSelectedMethod: ScoringInputMethod.cricket);
          }
          if (value.newMatch is Bobs || value.newMatch is ATC) {
            newState = newState.copyWith(
                newInputs: [ScoringInputMethod.simple],
                newSelectedMethod: ScoringInputMethod.simple);
          }
          state = newState;
          router.push(ScoringScreen.path);
        });
  }
}
