import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proscore_darts/src/core/constant_variables.dart';

import '../../../account/doman/entities/app_user.dart';

@immutable
abstract class DartsMatch {
  const DartsMatch({
    required this.matchType,
    required this.name,
    required this.matchId,
    required this.dateTime,
    required this.players,
    required this.playSets,
    required this.firstTo,
    required this.sets,
    required this.startingScore,
    this.winningPlayer,
  });
  final String matchType;
  final String name;
  final String matchId;
  final DateTime dateTime;
  final List<Player> players;
  final bool playSets;
  final int firstTo;
  final List<DartsSet> sets;
  final int startingScore;
  final Player? winningPlayer;

  int getScore(int playerIndex);
  List<Chalk> getChalks(int playerIndex);
  int getTurn(DartsMatch match) => match.players.indexWhere((Player e) =>
      e.playerId == match.sets.last.legs.last.throws.last.player.playerId);
  int getIndicatedScore(int turn);
  int getLegWins(String playerId) {
    var legWins = 0;
    for (final set in sets) {
      for (final _ in set.legs) {
        if (winningPlayer?.playerId == playerId) legWins += 1;
      }
    }
    return legWins;
  }

  int getSetWins(String playerId) {
    var setWins = 0;
    for (final _ in sets) {
      if (winningPlayer?.playerId == playerId) setWins += 1;
    }
    return setWins;
  }

  DartsMatch inputScored(int score) {
    var newSets = [...sets];
    newSets.last = sets.last.inputScored(score);
    return copyWith(newSets: newSets);
  }

  DartsMatch throwDart(Dart dartThrown, [bool isDart = true]) {
    var newSets = [...sets];
    newSets.last = sets.last.throwDart(dartThrown, isDart);
    return copyWith(newSets: newSets);
  }

  Dart checkDartIsValid(Dart dartThrown);
  DartsMatch updateAfterThrow();
  bool checkForWin(int turn);
  bool checkForChangeTurn(int turn);
  DartsMatch changeTurn();
  DartsMatch addwinnerToLeg(
      {required Player winner, required int dartsThrown}) {
    final turn = players.indexWhere((Player e) =>
        e.playerId == sets.last.legs.last.throws.last.player.playerId);
    var newSets = [...sets];
    newSets.last =
        sets.last.addWinnerToLeg(winner: winner, dartsThrown: dartsThrown);
    var firstToLegs = playSets ? 5 : firstTo;
    var legWins = 0;
    for (var leg in newSets.last.legs) {
      if (leg.winningPlayer == players[turn]) legWins++;
    }
    // check for set win
    if (legWins == firstToLegs) {
      // add winner to set
      newSets.last = newSets.last.addWinnerToSet(winner: winner);
      var firstToSets = playSets ? firstTo : 1;
      var setWins = 0;
      for (var set in newSets) {
        if (set.winningPlayer == players[turn]) setWins++;
      }
      if (setWins == firstToSets) {
        return copyWith(newSets: newSets, newWinningPlayer: winner);
      }
    }
    return copyWith(newSets: newSets);
  }

  DartsMatch updateNumberOfDartsThrown(int num) {
    var newSets = [...sets];
    newSets.last = sets.last.updateNumberOfDartsThrown(num);
    return copyWith(newSets: newSets);
  }

  DartsMatch beginNewSet() {
    var startingPlayerIndex =
        getNewTurn(length: players.length, currentIndex: getTurn(this));
    var newSets = [
      ...sets,
      DartsSet(
          setIndex: sets.last.setIndex + 1,
          startingPlayerIndex: startingPlayerIndex,
          legs: [
            DartsLeg(legIndex: 1, throws: [
              DartThrow(
                  throwIndex: 1,
                  player: players[startingPlayerIndex],
                  numberOfDartsThrown: 0)
            ])
          ])
    ];
    return copyWith(newSets: newSets);
  }

  DartsMatch beginNewLeg() {
    var startingPlayer =
        getNewTurn(length: players.length, currentIndex: getTurn(this));
    var newLegs = [
      ...sets.last.legs,
      DartsLeg(legIndex: sets.last.legs.last.legIndex + 1, throws: [
        DartThrow(
            throwIndex: 1,
            player: players[startingPlayer],
            numberOfDartsThrown: 0)
      ])
    ];
    var newSets = [...sets];
    newSets.last = sets.last._copyWith(newLegs: newLegs);
    return copyWith(newSets: newSets);
  }

  Map<String, dynamic> get toJson;

  DartsMatch copyWith(
      {List<Player>? newPlayers,
      bool? newPlaySets,
      int? newFirstTo,
      List<DartsSet>? newSets,
      int? newStartingScore,
      Player? newWinningPlayer});
}

class DartsSet {
  const DartsSet(
      {required this.setIndex,
      required this.startingPlayerIndex,
      required this.legs,
      this.winningPlayer});
  final int setIndex;
  final List<DartsLeg> legs;
  final int startingPlayerIndex;
  final Player? winningPlayer;

  DartsSet throwDart(Dart dartThrown, [bool isDart = true]) {
    var newLegs = [...legs];
    newLegs.last = legs.last.throwDart(dartThrown, isDart);
    return _copyWith(newLegs: newLegs);
  }

  DartsSet inputScored(int score) {
    var newLegs = [...legs];
    newLegs.last = legs.last.inputScored(score);
    return _copyWith(newLegs: newLegs);
  }

  DartsSet updateThrow(DartThrow thrown) {
    var newLegs = [...legs];
    newLegs.last = legs.last.updateThrow(thrown);
    return _copyWith(newLegs: newLegs);
  }

  DartsSet changeTurn(Player nextPlayer) {
    var newLegs = [...legs];
    newLegs.last = legs.last.changeTurn(nextPlayer);
    return _copyWith(newLegs: newLegs);
  }

  DartsSet addWinnerToLeg({required Player winner, required int dartsThrown}) {
    var newLegs = [...legs];
    newLegs.last =
        legs.last.addWinnerToLeg(winner: winner, dartsThrown: dartsThrown);
    return _copyWith(newLegs: newLegs);
  }

  DartsSet updateNumberOfDartsThrown(int num) {
    var newLegs = [...legs];
    newLegs.last = legs.last.updateNumberOfDartsThrown(num);
    return _copyWith(newLegs: newLegs);
  }

  DartsSet addWinnerToSet({required Player winner}) =>
      _copyWith(newWinningPlayer: winner);

  Map<String, dynamic> get toJson => {
        'setIndex': setIndex,
        'startingPlayerIndex': startingPlayerIndex,
        'legs': [for (final DartsLeg leg in legs) leg.toJson],
        'winningPlayer': winningPlayer?.toJson,
      };

  factory DartsSet.fromJson(Map<String, dynamic> setJson) => DartsSet(
      setIndex: setJson['setIndex'],
      startingPlayerIndex: setJson['startingPlayerIndex'],
      legs: [
        for (final Map<String, dynamic> legJson in setJson['legs'] ?? [])
          DartsLeg.fromJson(legJson)
      ],
      winningPlayer: Player.fromJson(setJson['winningPlayer']));

  DartsSet _copyWith(
          {int? newStartingPlayerIndex,
          List<DartsLeg>? newLegs,
          Player? newWinningPlayer}) =>
      DartsSet(
          setIndex: setIndex,
          startingPlayerIndex: newStartingPlayerIndex ?? startingPlayerIndex,
          legs: newLegs ?? legs,
          winningPlayer: newWinningPlayer ?? winningPlayer);
}

class DartsLeg {
  const DartsLeg(
      {required this.legIndex, required this.throws, this.winningPlayer});
  final int legIndex;
  final List<DartThrow> throws;
  final Player? winningPlayer;

  DartsLeg throwDart(Dart dartThrown, [bool isDart = true]) {
    var newThrows = [...throws];
    newThrows.last = throws.last.throwDart(dartThrown, isDart);
    return _copyWith(newThrows: newThrows);
  }

  DartsLeg inputScored(int score) {
    var newThrows = [...throws];
    newThrows.last = throws.last.inputScored(score);
    return _copyWith(newThrows: newThrows);
  }

  DartsLeg updateThrow(DartThrow thrown) {
    var newThrows = [...throws];
    newThrows.last = thrown;
    return _copyWith(newThrows: newThrows);
  }

  DartsLeg updateNumberOfDartsThrown(int num) {
    var newThrows = [...throws];
    newThrows.last = throws.last.updatenumberOfDartsThrown(num);
    return _copyWith(newThrows: newThrows);
  }

  DartsLeg changeTurn(Player nextPlayer) {
    var newThrows = [...throws];
    newThrows.add(DartThrow(
        throwIndex: newThrows.last.throwIndex + 1,
        player: nextPlayer,
        darts: [],
        numberOfDartsThrown: 0));
    return _copyWith(newThrows: newThrows);
  }

  DartsLeg addWinnerToLeg({required Player winner, required int dartsThrown}) {
    DartsLeg newLeg = updateNumberOfDartsThrown(dartsThrown);
    return newLeg._copyWith(newWinningPlayer: winner);
  }

  Map<String, dynamic> get toJson => {
        'legIndex': legIndex,
        'throws': [for (final DartThrow thrown in throws) thrown.toJson],
        'winningPlayer': winningPlayer?.toJson,
      };

  factory DartsLeg.fromJson(Map<String, dynamic> legJson) => DartsLeg(
      legIndex: legJson['legIndex'] ?? 0,
      throws: [
        for (final Map<String, dynamic> throwJson in legJson['throws'] ?? [])
          DartThrow.fromJson(throwJson)
      ],
      winningPlayer: Player.fromJson(legJson['winningPlayer']));

  DartsLeg _copyWith({List<DartThrow>? newThrows, Player? newWinningPlayer}) =>
      DartsLeg(
          legIndex: legIndex,
          throws: newThrows ?? throws,
          winningPlayer: newWinningPlayer ?? winningPlayer);
}

class DartThrow {
  const DartThrow(
      {required this.throwIndex,
      required this.player,
      this.scored = 0,
      this.darts = const [],
      required this.numberOfDartsThrown});
  final int throwIndex;
  final Player player;
  final int scored;
  final List<Dart> darts;
  final int numberOfDartsThrown;

  DartThrow throwDart(Dart dartThrown, [bool isDart = true]) {
    var theseDarts = [...darts];
    theseDarts.add(dartThrown);
    return _copyWith(
        newDarts: theseDarts,
        newScored: scored,
        newNumberOfDrtsThrown: isDart ? numberOfDartsThrown + 1 : 0);
  }

  DartThrow inputScored(int score) {
    const theseDarts = <Dart>[];
    final scored = score;
    return _copyWith(newDarts: theseDarts, newScored: scored);
  }

  DartThrow updateScore(int score) => _copyWith(newScored: score);

  DartThrow updatenumberOfDartsThrown(int num) =>
      _copyWith(newNumberOfDrtsThrown: num);

  Map<String, dynamic> get toJson => {
        'throwIndex': throwIndex,
        'player': player.toJson,
        'scored': scored,
        'thrownDarts': [for (Dart dart in darts) dart.toJson],
        'numberOfDartsThrown': numberOfDartsThrown
      };

  factory DartThrow.fromJson(Map<String, dynamic> throwJson) => DartThrow(
        throwIndex: throwJson['throwIndex'] ?? 0,
        player: Player.fromJson(throwJson['player']),
        scored: throwJson['scored'] ?? 0,
        darts: [
          for (Map<String, dynamic> dartJson in throwJson['thrownDarts'] ?? [])
            Dart.fromJson(dartJson)
        ],
        numberOfDartsThrown: throwJson['numberOfDartsThrown'] ?? 0,
      );

  DartThrow _copyWith(
          {Player? newPlayer,
          int? newScored,
          List<Dart>? newDarts,
          int? newNumberOfDrtsThrown}) =>
      DartThrow(
          throwIndex: throwIndex,
          player: newPlayer ?? player,
          scored: newScored ?? scored,
          darts: newDarts ?? darts,
          numberOfDartsThrown: newNumberOfDrtsThrown ?? numberOfDartsThrown);
}

class Dart {
  const Dart(
      {required this.dartIndex,
      required this.section,
      required this.multiplier});
  final int dartIndex;
  final int section;
  final int multiplier;

  int get score => section * multiplier;

  String get lable {
    if (section == 0) return 'Miss';
    if (section == 25 && multiplier == 2) return 'Bull';
    if (multiplier == 3) return 'T$section';
    if (multiplier == 2) return 'D$section';
    return '$section';
  }

  Map<String, dynamic> get toJson => {
        'thrownDartIndex': dartIndex,
        'section': section,
        'multiplier': multiplier
      };

  factory Dart.missed() => const Dart(dartIndex: 0, section: 0, multiplier: 1);

  factory Dart.fromJson(Map<String, dynamic> dartJson) => Dart(
      dartIndex: dartJson['thrownDartIndex'] ?? 0,
      section: dartJson['section'] ?? 0,
      multiplier: dartJson['multiplier'] ?? 0);
}

class Chalk {
  const Chalk(this.lable, {this.section});
  final String lable;
  final int? section;
}

enum MatchType { bobs, clock, cricket, x01 }
