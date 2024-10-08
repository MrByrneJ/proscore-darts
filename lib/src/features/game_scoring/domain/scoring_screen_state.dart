import 'package:uuid/uuid.dart';

import '../../../core/enums.dart';
import 'entities/bobs.dart';
import 'entities/darts_match.dart';
import 'entities/x01.dart';

class ScoringScreenState {
  const ScoringScreenState({
    required this.dartsMatch,
    required this.indicatedScore,
    required this.dartsRemaining,
    required this.availableInputs,
    required this.selectedInput,
    this.selectedMultiplier = SelectedMultiplier.single,
    required this.indicatedDarts,
    this.showEndOfLegDialog = false,
  });
  final DartsMatch dartsMatch;
  final int indicatedScore;
  final int dartsRemaining;
  final List<ScoringInputMethod> availableInputs;
  final ScoringInputMethod selectedInput;
  final SelectedMultiplier selectedMultiplier;
  final List<Dart> indicatedDarts;
  final bool showEndOfLegDialog;

  ScoringScreenState.initial()
      : dartsMatch = X01(
            matchId: const Uuid().v1(),
            dateTime: DateTime.now(),
            doubleIn: false,
            doubleOut: true,
            players: const [],
            firstTo: 5,
            playSets: false,
            sets: const [],
            startingScore: 501),
        indicatedScore = 1,
        dartsRemaining = 3,
        availableInputs = const [
          ScoringInputMethod.keypad,
          ScoringInputMethod.field
        ],
        selectedInput = ScoringInputMethod.keypad,
        selectedMultiplier = SelectedMultiplier.single,
        indicatedDarts = const [],
        showEndOfLegDialog = false;

  ScoringScreenState updateMatch(DartsMatch match) =>
      copyWith(newDartsMatch: match);

  ScoringScreenState inputIndicatedScore(String keyed) {
    var score = indicatedScore;
    try {
      score = int.parse(keyed);
    } catch (_) {
      return copyWith(newIndicatedScore: indicatedScore);
    }
    if (score > 180) return copyWith(newIndicatedScore: indicatedScore);
    score = int.parse(keyed);
    return copyWith(newIndicatedScore: score);
  }

  ScoringScreenState submitScored(int scored) {
    if (dartsMatch is! X01) return this;
    var newMatch = dartsMatch as X01;
    if (newMatch.getScore(getTurn(newMatch)) - scored < 0) scored = 0;
    if (newMatch.getScore(getTurn(newMatch)) - scored == 1 &&
        newMatch.doubleOut) scored = 0;
    return copyWith(newDartsMatch: newMatch.inputScored(scored));
  }

  ScoringScreenState throwDart(Dart dartThrown, [bool isDart = true]) {
    dartThrown = dartsMatch.checkDartIsValid(dartThrown);
    var newMatch = dartsMatch.throwDart(dartThrown, isDart);
    return copyWith(
        newDartsMatch: newMatch,
        newIndicatedDarts: [...newMatch.sets.last.legs.last.throws.last.darts],
        newDartsRemaining:
            3 - newMatch.sets.last.legs.last.throws.last.numberOfDartsThrown);
  }

  ScoringScreenState updateAfterThrow() {
    var newMatch = dartsMatch.updateAfterThrow();
    final thrown = newMatch.sets.last.legs.last.throws.last;
    final darts = thrown.darts;
    return copyWith(
        newDartsMatch: newMatch, newDartsRemaining: 3 - darts.length);
  }

  /// Returns the [index] of the [Player] cureently throwing.
  int getTurn(DartsMatch match) {
    var playerId = match.sets.last.legs.last.throws.last.player.playerId;
    var turn =
        match.players.indexWhere((element) => element.playerId == playerId);
    return turn;
  }

  /// Returns the Mulitple of that [Dart] : [Section] as an [int]
  int get getMultiple {
    if (selectedMultiplier == SelectedMultiplier.treble) return 3;
    if (selectedMultiplier == SelectedMultiplier.double) return 2;
    return 1;
  }

  ScoringScreenState updateSelectedInputMethod(ScoringInputMethod input) {
    var newIndicatedscore = dartsMatch.sets.last.legs.last.throws.last.scored;
    if (input == ScoringInputMethod.keypad) newIndicatedscore = 0;
    return copyWith(
        newSelectedMethod: input, newIndicatedScore: newIndicatedscore);
  }

  ScoringScreenState updateSelectedMultiplier(SelectedMultiplier multiplier) =>
      copyWith(newSelectedMultiplier: multiplier);

  ScoringScreenState updateNumberOfDartsThrown(int num) =>
      copyWith(newDartsMatch: dartsMatch.updateNumberOfDartsThrown(num));

  ScoringScreenState update({bool? changeTurn = false}) {
    var newMatch = dartsMatch;
    var turn = getTurn(dartsMatch);
    // check for win
    if (dartsMatch.checkForWin(turn)) {
      int dartsThrown = dartsMatch.sets.last.legs.last.throws.last.darts.length;
      // TODO: highest score wins bobs. not last player
      newMatch = dartsMatch.addwinnerToLeg(
          winner: dartsMatch.players[turn],
          dartsThrown: dartsThrown == 0 ? 3 : dartsThrown);
      return copyWith(newDartsMatch: newMatch, newShowEndOfLegDialog: true);
    }
    // check for changeTurn
    if (changeTurn == true || dartsMatch.checkForChangeTurn(turn)) {
      newMatch = newMatch.changeTurn();
      turn = getTurn(newMatch);
      if (newMatch is Bobs &&
          !newMatch.allowNegativeNumbers &&
          newMatch.getScore(turn) <= 0) {
        newMatch = dartsMatch.addwinnerToLeg(
            winner: dartsMatch.players[turn], dartsThrown: 3);
        return copyWith(newDartsMatch: newMatch, newShowEndOfLegDialog: true);
      }
      return copyWith(
          newDartsMatch: newMatch,
          newDartsRemaining: 3,
          newIndicatedDarts: [],
          newIndicatedScore: newMatch.getIndicatedScore(turn));
    }
    return copyWith(
        newDartsMatch: newMatch,
        newIndicatedScore: newMatch.getIndicatedScore(turn));
  }

  ScoringScreenState copyWith(
          {DartsMatch? newDartsMatch,
          int? newIndicatedScore,
          int? newDartsRemaining,
          List<ScoringInputMethod>? newInputs,
          ScoringInputMethod? newSelectedMethod,
          SelectedMultiplier? newSelectedMultiplier,
          List<Dart>? newIndicatedDarts,
          bool? newShowEndOfLegDialog}) =>
      ScoringScreenState(
          dartsMatch: newDartsMatch ?? dartsMatch,
          indicatedScore: newIndicatedScore ?? indicatedScore,
          dartsRemaining: newDartsRemaining ?? dartsRemaining,
          availableInputs: newInputs ?? availableInputs,
          selectedInput: newSelectedMethod ?? selectedInput,
          selectedMultiplier: newSelectedMultiplier ?? selectedMultiplier,
          indicatedDarts: newIndicatedDarts ?? indicatedDarts,
          showEndOfLegDialog: newShowEndOfLegDialog ?? showEndOfLegDialog);
}
